import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:gestao_tads/view/login.view.dart';
import 'package:gestao_tads/view/main.view.dart';
import 'package:gestao_tads/view/permissoes.view.dart';
import 'package:flutter/material.dart';
import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:http/http.dart' as http;

import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';

class TelaCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
        children: [
          CustomTextField(title: 'Nome', hint: 'EX: meunome'),
          CustomTextField(title: 'Senha', hint: 'EX: *************'),
          CustomTextField(title: 'Email', hint: 'EX: email@email.com'),
          CustomTextField(title: 'CPF', hint: 'EX: 000.000.000-00 ...'),
          CustomTextField(title: 'Data de Nascimento', hint: 'EX: 00/00/0000'),
          CustomTextField(title: 'Endereço', hint: 'EX: Rua de teste, nº 0'),
          CustomTextField(title: 'Grupo de usuarios', hint: 'EX: 1'),
          Column(
            children: [
              CustomButton(
                child: Text('Cadastrar'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaPrincipal()))
                },
                style: CustomButton.SUCCESS,
              ),
              CustomButton(
                child: Text('Cancelar'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaLogin()))
                },
                style: CustomButton.DEFAULT,
              ),
            ],
          )
        ],
      )),
    );
  }
}
