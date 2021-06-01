import 'dart:convert';

import 'package:gestao_tads/model/equipamento.dart';
import 'package:gestao_tads/model/ordemServico.dart';
import 'package:http/http.dart';

import 'ApiController.dart';

class OSController {
  Future<bool> _adicionarEquipamento(
      OrdemServico ordem, Equipamento equipamento) async {
    String id_ordem = ordem.id.toString(); //pega o id da ordem do guilherme
    String endpoint =
        "ordem_servico/$id_ordem/equipamentos"; //joga no endpoint pra url
    Response response = await ApiController.instance().post(
        endpoint,
        equipamento
            .toMap()); //chama o post que eu simplifiquei lá puxando o token sozinho
    //Teoricamente o post na api vai ser isso kkkkkkk
    print("Resposta "+response.body);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<OrdemServico> _adicionarOS(OrdemServico ordem) async {
    Response response =
        await ApiController.instance().post("ordem_servico", ordem.toMap());
    print("Resposta "+response.body);
    if (response.statusCode == 201) {
      return OrdemServico.fromMap(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> lancarOS(OrdemServico os, Equipamento equipamento) async {
    OrdemServico ordem = await _adicionarOS(os);
    if (ordem != null) {
      return await _adicionarEquipamento(ordem, equipamento);
    } else {
      print('Erro inserindo a ordem');
    }
    return false;
  }
}
