const assert = require('assert');
const fs = require('fs');

const {
  initializeTestEnvironment,
  assertSucceeds,
} = require('@firebase/rules-unit-testing');

const {
  collection,
  doc,
  getDoc,
  getDocs,
  setDoc,
  updateDoc,
} = require('firebase/firestore');

const PROJECT_ID = 'devventure-441c5';

let testEnv;

function authedDb(uid) {
  return testEnv.authenticatedContext(uid).firestore();
}

async function seedDoc(path, data) {
  await testEnv.withSecurityRulesDisabled(async (context) => {
    await setDoc(doc(context.firestore(), path), data);
  });
}

function userData(uid, overrides = {}) {
  return {
    id: uid,
    nome: `Aluno ${uid}`,
    email: `${uid}@example.com`,
    criadoEm: new Date('2026-01-01T00:00:00.000Z'),
    points: 0,
    level: 'junior',
    role: 'student',
    ...overrides,
  };
}

async function assertPermissionDenied(operation) {
  try {
    await operation;
    assert.fail('Expected operation to be denied by Firestore rules.');
  } catch (error) {
    assert.strictEqual(error.code, 'permission-denied');
  }
}

describe('firestore.rules', () => {
  before(async () => {
    testEnv = await initializeTestEnvironment({
      projectId: PROJECT_ID,
      firestore: {
        rules: fs.readFileSync('firestore.rules', 'utf8'),
      },
    });
  });

  beforeEach(async () => {
    await testEnv.clearFirestore();
  });

  after(async () => {
    if (testEnv) {
      await testEnv.cleanup();
    }
  });

  describe('users', () => {
    it('allows an authenticated student to read only their own user document', async () => {
      await seedDoc('users/alice', userData('alice'));
      await seedDoc('users/bob', userData('bob'));

      const aliceDb = authedDb('alice');

      await assertSucceeds(getDoc(doc(aliceDb, 'users/alice')));
      await assertPermissionDenied(getDoc(doc(aliceDb, 'users/bob')));
      await assertPermissionDenied(getDocs(collection(aliceDb, 'users')));
    });

    it('denies unauthenticated access to user documents', async () => {
      await seedDoc('users/alice', userData('alice'));

      const guestDb = testEnv.unauthenticatedContext().firestore();

      await assertPermissionDenied(getDoc(doc(guestDb, 'users/alice')));
    });

    it('allows a student to update editable fields on their own user document', async () => {
      await seedDoc('users/alice', userData('alice'));

      const aliceDb = authedDb('alice');

      await assertSucceeds(
        updateDoc(doc(aliceDb, 'users/alice'), {
          nome: 'Alice Silva',
        }),
      );
    });

    it('denies writes to another student user document', async () => {
      await seedDoc('users/bob', userData('bob'));

      const aliceDb = authedDb('alice');

      await assertPermissionDenied(
        updateDoc(doc(aliceDb, 'users/bob'), {
          points: 999,
          level: 'senior',
        }),
      );
    });

    it('denies student writes to points or level, including their own document', async () => {
      await seedDoc('users/alice', userData('alice'));

      const aliceDb = authedDb('alice');

      await assertPermissionDenied(
        updateDoc(doc(aliceDb, 'users/alice'), {
          points: 50,
        }),
      );

      await assertPermissionDenied(
        updateDoc(doc(aliceDb, 'users/alice'), {
          level: 'pleno',
        }),
      );
    });

    it('denies student writes to pontuacao or nivel when Portuguese field names exist', async () => {
      await seedDoc(
        'users/alice',
        userData('alice', {
          pontuacao: 0,
          nivel: 'junior',
        }),
      );

      const aliceDb = authedDb('alice');

      await assertPermissionDenied(
        updateDoc(doc(aliceDb, 'users/alice'), {
          pontuacao: 50,
        }),
      );

      await assertPermissionDenied(
        updateDoc(doc(aliceDb, 'users/alice'), {
          nivel: 'pleno',
        }),
      );
    });
  });

  describe('answers', () => {
    it('allows a student to read and write only their own answers', async () => {
      await seedDoc('answers/alice-answer', {
        alunoId: 'alice',
        resposta: 'A',
      });
      await seedDoc('answers/bob-answer', {
        alunoId: 'bob',
        resposta: 'B',
      });

      const aliceDb = authedDb('alice');

      await assertSucceeds(getDoc(doc(aliceDb, 'answers/alice-answer')));
      await assertSucceeds(
        setDoc(doc(aliceDb, 'answers/new-answer'), {
          alunoId: 'alice',
          resposta: 'C',
        }),
      );
      await assertSucceeds(
        updateDoc(doc(aliceDb, 'answers/alice-answer'), {
          resposta: 'D',
        }),
      );

      await assertPermissionDenied(getDoc(doc(aliceDb, 'answers/bob-answer')));
      await assertPermissionDenied(
        setDoc(doc(aliceDb, 'answers/for-bob'), {
          alunoId: 'bob',
          resposta: 'E',
        }),
      );
      await assertPermissionDenied(
        updateDoc(doc(aliceDb, 'answers/alice-answer'), {
          points: 100,
        }),
      );
    });
  });

  describe('sessions', () => {
    it('allows a student to read and write only their own sessions', async () => {
      await seedDoc('sessions/alice-session', {
        alunoId: 'alice',
        atividadeId: 'activity-1',
      });
      await seedDoc('sessions/bob-session', {
        alunoId: 'bob',
        atividadeId: 'activity-2',
      });

      const aliceDb = authedDb('alice');

      await assertSucceeds(getDoc(doc(aliceDb, 'sessions/alice-session')));
      await assertSucceeds(
        setDoc(doc(aliceDb, 'sessions/new-session'), {
          alunoId: 'alice',
          atividadeId: 'activity-3',
        }),
      );
      await assertSucceeds(
        updateDoc(doc(aliceDb, 'sessions/alice-session'), {
          concluida: true,
        }),
      );

      await assertPermissionDenied(getDoc(doc(aliceDb, 'sessions/bob-session')));
      await assertPermissionDenied(
        setDoc(doc(aliceDb, 'sessions/for-bob'), {
          alunoId: 'bob',
          atividadeId: 'activity-4',
        }),
      );
      await assertPermissionDenied(
        updateDoc(doc(aliceDb, 'sessions/alice-session'), {
          level: 'senior',
        }),
      );
    });
  });
});
