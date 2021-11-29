import 'dart:convert';

import '../../domain/entities/noticia_compelta_entity.dart';

class NoticiaCompletaMapper extends NoticiaCompleta {
  const NoticiaCompletaMapper({
    required String id,
    required String titulo,
    required String imagemURL,
    required String descricao,
  }) : super(
          id: id,
          titulo: titulo,
          imagemURL: imagemURL,
          descricao: descricao,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'imagemURL': imagemURL,
      'descricao': descricao,
    };
  }

  factory NoticiaCompletaMapper.fromMap(Map<String, dynamic> map) {
    return NoticiaCompletaMapper(
      id: map['id'],
      titulo: map['titulo'],
      imagemURL: map['imagemURL'],
      descricao: map['descricao'],
    );
  }

  NoticiaCompleta toEntity() {
    return NoticiaCompleta(
      id: id,
      titulo: titulo,
      imagemURL: imagemURL,
      descricao: descricao,
    );
  }

  factory NoticiaCompletaMapper.fromEntity(NoticiaCompleta rota) {
    return NoticiaCompletaMapper(
      id: rota.id,
      titulo: rota.titulo,
      imagemURL: rota.imagemURL,
      descricao: rota.descricao,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticiaCompletaMapper.fromJson(String source) =>
      NoticiaCompletaMapper.fromMap(json.decode(source));
}
