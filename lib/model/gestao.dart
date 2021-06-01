
import 'package:gestao_tads/model/grupoUsuario.dart';
import 'package:gestao_tads/model/ordemServico.dart';
import 'package:gestao_tads/model/persistenciaApi.dart';

import 'ordemServico.dart';

class Gestao {

  OrdemServico ordemServico;

  PersistenciaApi persistenciaAPI;

  List<OrdemServico> ordemServicoList;

  Gestao () {
    ordemServico = OrdemServico as OrdemServico;
    persistenciaAPI = PersistenciaApi();

  }

}