import 'package:flutter/material.dart';
import 'package:gestao_tads/view/TelaCadastroUsuario.view.dart';
import 'package:gestao_tads/view/TelaListarGrupos.view.dart';
import 'package:gestao_tads/view/TelaListarPermissoes.view.dart';

import 'TelaListarOrdem.view.dart';
import 'TelaNovaOrdem.view.dart';
import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';

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
              CustomButton(
                child: Text('LISTAR ORDENS SERVIÇO'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaListaOrdem()))
                },
                style: CustomButton.SUCCESS,
              ),
              CustomButton(
                child: Text('CADASTRAR ORDEM'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaNovaOrden()))
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
