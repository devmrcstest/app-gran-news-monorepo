import 'dart:convert';

import '../../domain/entities/noticia_entity.dart';

class NoticiaMapper extends Noticia {
  const NoticiaMapper({
    required String id,
    required String titulo,
    required String imagemURL,
  }) : super(
          id: id,
          titulo: titulo,
          imagemURL: imagemURL,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'imagemURL': imagemURL,
    };
  }

  factory NoticiaMapper.fromMap(Map<String, dynamic> map) {
    return NoticiaMapper(
      id: map['id'],
      titulo: map['titulo'],
      imagemURL: map['imagemURL'],
    );
  }

  Noticia toEntity() {
    return Noticia(
      id: id,
      titulo: titulo,
      imagemURL: imagemURL,
    );
  }

  factory NoticiaMapper.fromEntity(Noticia rota) {
    return NoticiaMapper(
      id: rota.id,
      titulo: rota.titulo,
      imagemURL: rota.imagemURL,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticiaMapper.fromJson(String source) =>
      NoticiaMapper.fromMap(json.decode(source));
}
