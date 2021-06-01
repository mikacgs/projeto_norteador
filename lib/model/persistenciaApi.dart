import 'dart:collection';
import 'dart:convert';
import 'package:gestao_tads/control/ApiController.dart';
import 'package:http/http.dart' as http;
import 'package:gestao_tads/model/ordemServico.dart';
import 'package:flutter/material.dart';

import '../main.dart';

const requisicaoLocal = "http://10.0.2.2:3232/"; // Por que dessa URL aqui ????

class PersistenciaApi {
  List ordemServico = [];

  // Requisição GET
  Future<Map> carregarOrdenServico() async {
    Map<String, String> headers = HashMap();
    headers['Authorization'] = 'Basic 1234';

    //print("Fazendo a requisição GET");

    http.Response resposta = await http.get(
        ApiController.getURI('ordemServico'),
        //vou criar uma função assim pra nós ir separando em endpoints os controller
        headers: headers);

    print("Resposta get da API ${resposta.body}");

    if (resposta.statusCode == 200 || resposta.statusCode == 204) {
      ordemServico = json.decode(resposta.body);
      return json.decode(resposta.body);
    }

    return null;
  }

  // requisição POST
  Future<Map> inserirNovoOrdemServico() async {
    print("Inserindo novo Ordem Servico...");
    Map<String, String> headers = HashMap();
    headers['Authorization'] = 'Basic 1234';
    headers['Accept'] = 'application/json';
    headers['Content-type'] = 'application/json';

    http.Response resposta = await http.post(
        Uri.parse("$requisicaoLocal/oredmServico"),
        headers: headers,
        body: json.encode(gestao.ordemServico.toMap()),
        encoding: Encoding.getByName('utf-8'));

    print("Resposta da inserção: ${resposta.body}");

    if (resposta.statusCode == 200 || resposta.statusCode == 201) {
      // atualiza a ordem servico com o id retornado pela api
      gestao.ordemServico.id = json.decode(resposta.body)['id'];
      //print("ID GERADO = ${gestao.oredemServico.id}");
      return json.decode(resposta.body);
    }
    return null;
  }

// // requisição PUT
// Future<Map> atualizarJogador() async {
//   print("Atualizando jogador...");
//   Map<String, String> headers = HashMap();
//   headers['Authorization'] = 'Basic 1234';
//   headers['Accept'] = 'application/json';
//   headers['Content-type'] = 'application/json';
//
//   http.Response resposta = await http.put(
//       "$requisicaoLocal/jogador/${gestao.ordemServico.id}",
//       headers: headers,
//       body: json.encode(gestao.ordemServico.toMap()),
//       encoding: Encoding.getByName('utf-8')
//   );
//
//   print("Resposta da atualização: ${resposta.body}");
//   print("Status code: ${resposta.statusCode}");
//
//   if(resposta.statusCode == 200 || resposta.statusCode == 201) {
//     print("ID Atualizado = ${gestao.ordemServico.id}");
//     return json.decode(resposta.body);
//   }
//
//   return null;
// }

// Future deletarJogador() async {
//   print("Deletando jogador...");
//   Map<String, String> headers = HashMap();
//   headers['Authorization'] = 'Basic 1234';
//
//
//   http.Response resposta = await http.delete(
//       "${requisicaoLocal}jogador/${gestao.ordemServico.id}",
//       headers: headers
//   );
//   print("Status code: ${resposta.statusCode}");
//
//   if(resposta.statusCode == 200 || resposta.statusCode == 201) {
//     print("ID Deletado = ${gestao.ordemServico.id}");
//   }
// }

}
