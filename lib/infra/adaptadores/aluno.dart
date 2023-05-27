
import '../../dto/nota.dart';

class Aluno {
  final String nome;
  final String email;
  final Nota nota;

  Aluno({required this.nome,
      required this.email,
      required this.nota});
}
