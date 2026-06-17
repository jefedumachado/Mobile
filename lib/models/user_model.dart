import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  final String nome;
  final String email;
  final DateTime criadoEm;
  final int pontos; // Adicionado para rastrear os pontos localmente se necessário

  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.criadoEm,
    this.pontos = 0, // Padrão começa com 0
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      nome: user.displayName ?? '',
      email: user.email ?? '',
      criadoEm: user.metadata.creationTime ?? DateTime.now(),
      pontos: 0,
    );
  }

  /// Método para atualizar os pontos atomicamente no Firestore
  Future<void> addPoints({required bool isRight}) async {
    // Se o aluno errou, não faz nada e encerra a função
    if (!isRight) return;

    final userRef = FirebaseFirestore.instance.collection('users').doc(id);

    try {
      await userRef.update({
        // Utiliza o FieldValue.increment para garantir a atomicidade
        'pontos': FieldValue.increment(1),
      });
    } catch (e) {
      print('Erro ao atualizar pontos: $e');
      rethrow;
    }
  }
}
