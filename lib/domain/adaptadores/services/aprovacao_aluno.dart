import '../../dto/aluno_dto.dart';
import '../../dto/aluno_materia_dto.dart';

class AprovacaoAluno {
  bool aprovacaoNota(AlunoDTO alunoDTO) {
    if (alunoDTO.nota.valor >= 0 && alunoDTO.nota.valor <= 10) {
      if (alunoDTO.nota.valor < 6) {
        return false;
      }
      return true;
    }
    return false;
  }

  bool porcentagemFalta(AlunoMateriaDTO alunoMateriaDTO) {
    if (alunoMateriaDTO.materiaDTO.quantidadeAulas != null) {
      double porcetagemFalta = (alunoMateriaDTO.materiaDTO.quantidadeAulas -
              alunoMateriaDTO.alunoDTO.falta) /
          100;
      if (porcetagemFalta >= 0 && porcetagemFalta <= 100) {
        if (porcetagemFalta > 25) {
          return false;
        }
        return true;
      }
    }
    return false;
  }

  String resultadoFinal(AlunoMateriaDTO alunoMateriaDTO) {
    var resultadoFinal = "";

    if (aprovacaoNota(alunoMateriaDTO.alunoDTO) &&
        porcentagemFalta(alunoMateriaDTO)) {
      resultadoFinal = "Aprovado";
    } else if (!porcentagemFalta(alunoMateriaDTO) &&
        aprovacaoNota(alunoMateriaDTO.alunoDTO)) {
      resultadoFinal = "Reprovado por falta com " +
          alunoMateriaDTO.alunoDTO.falta.toString() +
          " faltas";
    } else if (!aprovacaoNota(alunoMateriaDTO.alunoDTO) &&
        porcentagemFalta(alunoMateriaDTO)) {
      resultadoFinal = "Reprovado por nota com nota igual a:\n" +
          alunoMateriaDTO.alunoDTO.nota.valor.toString();
    } else if (!(aprovacaoNota(alunoMateriaDTO.alunoDTO) &&
        porcentagemFalta(alunoMateriaDTO))) {
      resultadoFinal = "Reprovado por nota e falta\n nota: " +
          alunoMateriaDTO.alunoDTO.nota.valor.toString() +
          "\n falta: " +
          alunoMateriaDTO.alunoDTO.falta.toString();
    }

    print("Enviado por email com sucesso");
    return resultadoFinal;
  }
}
