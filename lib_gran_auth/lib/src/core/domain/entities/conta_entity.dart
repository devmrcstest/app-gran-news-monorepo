import 'package:equatable/equatable.dart';
import 'package:lib_gran_core/lib_gran_core.dart';

class Conta extends Equatable {
  final String email;
  final String senha;

  const Conta({
    required this.email,
    required this.senha,
  });

  @override
  List<Object> get props => [email, senha];
}
