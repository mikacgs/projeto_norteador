import 'package:gestao_tads/view/cadastro.view.dart';
import 'package:gestao_tads/view/grupos.view.dart';
import 'package:gestao_tads/view/permissoes.view.dart';
import 'package:flutter/material.dart';

import 'Equipamentos.dart';
import 'cadequipamento.dart';
import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';
import 'listaOrdems.view.dart';
import 'novaOrdem.view.dart';

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
                child: Text('CADASTRAR NOVA ORDENS'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaNovaOrden()))
                },
                style: CustomButton.SUCCESS,
              ),
              CustomButton(
                child: Text('CADASTRAR EQUIPAMENTO'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CadEquip()))
                },
                style: CustomButton.SUCCESS,// vai largando comentario aqui kkkk dps a gente só apaga
              ),
              CustomButton(
                child: Text('EQUIPAMENTOS'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Equipamentos()))
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
