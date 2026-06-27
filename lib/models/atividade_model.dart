import 'package:cloud_firestore/cloud_firestore.dart';

class AtividadeModel {
  final String id;
  final String titulo;
  final bool concluida;
  final int pontosGanhos;
  final DateTime data;

  AtividadeModel({
    required this.id,
    required this.titulo,
    this.concluida = false,
    this.pontosGanhos = 0,
    required this.data,
  });

  // Converte o modelo para um mapa (útil para salvar no Firestore se precisar)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'concluida': concluida,
      'pontosGanhos': pontosGanhos,
      'data': Timestamp.fromDate(data),
    };
  }

  // Cria o AtividadeModel a partir de um DocumentSnapshot do Firestore (usado na sua AtividadeService)
  factory AtividadeModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return AtividadeModel(
      id: doc.id,
      titulo: map['titulo'] ?? '',
      concluida: map['concluida'] ?? false,
      pontosGanhos: map['pontosGanhos']?.toInt() ?? 0,
      data: map['data'] != null
          ? (map['data'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }
}