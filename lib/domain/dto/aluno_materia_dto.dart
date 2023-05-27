import 'aluno_dto.dart';
import 'materia_dto.dart';

class AlunoMateriaDTO {
  final AlunoDTO alunoDTO;
  final MateriaDTO materiaDTO;

  AlunoMateriaDTO(
      {required this.alunoDTO, required this.materiaDTO});
}
