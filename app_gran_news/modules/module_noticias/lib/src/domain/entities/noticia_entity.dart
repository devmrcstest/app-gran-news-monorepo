import 'package:equatable/equatable.dart';

class Noticia extends Equatable {
  final String id;
  final String titulo;
  final String imagemURL;

  const Noticia({
    required this.id,
    required this.titulo,
    required this.imagemURL,
  });

  Noticia copyWith({
    String? id,
    String? titulo,
    String? imagemURL,
  }) {
    return Noticia(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      imagemURL: imagemURL ?? this.imagemURL,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, titulo, imagemURL];
}
