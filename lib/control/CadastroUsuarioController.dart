import 'dart:convert';

import 'package:gestao_tads/control/ApiController.dart';
import 'package:gestao_tads/model/usuario.dart';
import 'package:http/http.dart';

class CadastroUsuarioController {
  Future<bool> adicionarUsuario(Usuario usuario) async {
    //Adicionar usuario
    print(usuario);
    Response response =
        await ApiController.instance().post("usuario", usuario.toMap());
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<Usuario> buscarUsuario(int id) async {
    //Buscar usuário por id
    Response response = await ApiController.instance().get("usuario/$id");
    if (response.statusCode == 200) {
      return Usuario.fromMap(json.decode(response.body));
    }
    return null;
  }

  Future<List<Usuario>> buscarUsuarios() async {
    //Buscar todos usuários
    Response response = await ApiController.instance().get("usuario");
    print(response.body);
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      List<Usuario> test =
          List<Usuario>.from(list.map((model) => Usuario.fromMap(model)));
      return test;
    }
    return null;
  }
}
