import 'package:gestao_tads/view/components/CustomBoxText.dart';
import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:flutter/material.dart';

import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';
import 'components/CustomButton.dart';
import 'components/CustomTextArea.dart';
import 'TelaDetalhesOrdem.dart';


class TelaListaOrdem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBoxText(
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("n° Orden")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Data Orden")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Status Orden")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Data Retirada Orden")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Senha Equipamento")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Descrição")),
                  ]),
                  style: CustomBoxText.SUCCESS),
              CustomButton(
                child: Text('DETALHES ORDEN'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetalhesListaOrden()))
                },
                style: CustomButton.SUCCESS,
              ),
              Text("       "),
              CustomBoxText(
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("n° Orden")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Data Orden")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Status Orden")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Data Retirada Orden")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Senha Equipamento")),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Descrição")),
                  ]),
                  style: CustomBoxText.SUCCESS),
              CustomButton(
                child: Text('DETALHES ORDEN'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetalhesListaOrden()))
                },
                style: CustomButton.SUCCESS,
              ),
              Column(),
            ],
          )),
    );
  }
}
