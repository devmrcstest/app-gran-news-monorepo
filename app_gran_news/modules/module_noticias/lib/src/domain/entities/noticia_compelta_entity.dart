import 'package:equatable/equatable.dart';

class NoticiaCompleta extends Equatable {
  final String id;
  final String titulo;
  final String imagemURL;
  final String descricao;

  const NoticiaCompleta({
    required this.id,
    required this.titulo,
    required this.imagemURL,
    required this.descricao,
  });

  NoticiaCompleta copyWith({
    String? id,
    String? titulo,
    String? imagemURL,
    String? descricao,
  }) {
    return NoticiaCompleta(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      imagemURL: imagemURL ?? this.imagemURL,
      descricao: descricao ?? this.descricao,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        titulo,
        imagemURL,
        descricao,
      ];
}
