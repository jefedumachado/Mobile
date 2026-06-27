import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart'; // Ajuste o caminho conforme seu projeto

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Referência direta para a coleção de usuários
  CollectionReference get _colecaoUsuarios => _db.collection('usuarios');

  /// Busca os dados do usuário no Firestore filtrando pelo UID.
  Future<UserModel> getByUser(String uid) async {
    try {
      final doc = await _colecaoUsuarios.doc(uid).get();

      if (doc.exists && doc.data() != null) {
        // Converte o mapa do Firestore para o seu UserModel
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Usuário não encontrado.');
      }
    } catch (e) {
      throw Exception('Não foi possível carregar os dados do usuário.');
    }
  }

  /// Salva ou atualiza todos os dados de um usuário no Firestore.
  Future<void> salvarUsuario(UserModel usuario) async {
    try {
      await _colecaoUsuarios.doc(usuario.id).set(
        usuario.toMap(),
        SetOptions(merge: true), // Garante que não vai apagar outros campos caso existam
      );
    } catch (e) {
      throw Exception('Não foi possível salvar os dados do usuário.');
    }
  }

  /// Adiciona pontos ao total do usuário (útil para chamar logo após concluir uma atividade).
  /// Esta operação usa uma transação (FieldValue.increment) para evitar problemas de concorrência.
  Future<void> adicionarPontos(String uid, int pontosNovos) async {
    try {
      await _colecaoUsuarios.doc(uid).update({
        'points': FieldValue.increment(pontosNovos),
      });
    } catch (e) {
      throw Exception('Não foi possível atualizar a pontuação do usuário.');
    }
  }

  /// Atualiza o nível (Senioridade) do usuário de forma direta.
  Future<void> atualizarNivel(String uid, String novoNivel) async {
    try {
      await _colecaoUsuarios.doc(uid).update({
        'nivel': novoNivel, // Usa a chave 'nivel' mapeada no seu de/para do fromMap
      });
    } catch (e) {
      throw Exception('Não foi possível atualizar o nível do usuário.');
    }
  }
}