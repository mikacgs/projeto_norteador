import 'package:gestao_tads/view/cadastro.view.dart';
import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:gestao_tads/view/grupos.view.dart';
import 'package:gestao_tads/view/permissoes.view.dart';
import 'package:flutter/material.dart';

import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';
import 'components/CustomTextArea.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
        children: [
          Column(
            children: [
              CustomButton(
                child: Text('GRUPOS'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaGrupos()))
                },
                style: CustomButton.SUCCESS,
              ),
              CustomButton(
                child: Text('PERMISSOES'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaPermissao()))
                },
                style: CustomButton.SUCCESS,
              ),
              CustomButton(
                child: Text('CADASTRAR NOVO USUARIO'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaCadastro()))
                },
                style: CustomButton.SUCCESS,
              ),
            ],
          )
        ],
      )),
    );
  }
}
