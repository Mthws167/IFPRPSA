

import 'nota_dto.dart';

class AlunoDTO {
  final String nome;
  final String email;
  final int falta;
  final NotaDTO nota;

  AlunoDTO({required this.nome,
      required this.email,
      required this.nota,
      required this.falta});
}
