import 'dart:convert';

import 'package:gestao_tads/model/equipamento.dart';
import 'package:gestao_tads/model/ordemServico.dart';
import 'package:http/http.dart';

import 'ApiController.dart';

class OSController {
  Future<bool> _adicionarEquipamento(
      OrdemServico ordem, Equipamento equipamento) async {
    String id_ordem = ordem.id.toString();
    String endpoint = "/equipamentos";
    print(endpoint);
    Response response =
        await ApiController.instance().post(endpoint, equipamento.toMap());
    print("Resposta " + response.statusCode.toString());

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<OrdemServico> _adicionarOS(OrdemServico ordem) async {
    Response response =
        await ApiController.instance().post("ordem_servico", ordem.toMap());
    if (response.statusCode == 201) {
      return OrdemServico.fromMap(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> lancarOS(OrdemServico os, Equipamento equipamento) async {
    OrdemServico ordem = await _adicionarOS(os);
    print("Os atual:" + ordem.toMap().toString());
    if (ordem != null) {
      return await _adicionarEquipamento(ordem, equipamento);
    } else {
      print('Erro inserindo a ordem');
    }
    return false;
  }
}
