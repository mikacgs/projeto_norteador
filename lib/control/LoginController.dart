import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestao_tads/control/ApiController.dart';
import 'package:gestao_tads/view/main.view.dart';

class LoginController {
  String email;
  String senha;

  LoginController(this.email, this.senha);

  void autenticar(BuildContext context) async {
    var autenticado = await ApiController.instance().autenticar(email, senha);
    if (autenticado == ApiController.SUCESSO) {
      print('Logado com sucesso');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => TelaPrincipal()));
    } else if (autenticado == ApiController.ACESSO_NEGADO) {
      print("Usuário ou senha incorretos, tente novamente");
    } else {
      print("Há um problema com a nossa API tente novamente mais tarde");
    }
  }
}
