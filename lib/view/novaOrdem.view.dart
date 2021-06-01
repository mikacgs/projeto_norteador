import 'package:gestao_tads/control/OSController.dart';
import 'package:gestao_tads/model/equipamento.dart';
import 'package:gestao_tads/model/ordemServico.dart';
import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'cadequipamento.dart';
import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';
import 'components/CustomTextArea.dart';

class TelaNovaOrden extends StatefulWidget {
  TelaNovaOrdenState createState() => TelaNovaOrdenState();
}

class TelaNovaOrdenState extends State<TelaNovaOrden> {
  final descProblemaTextController = TextEditingController();
  final serialEquipamentoTextController = TextEditingController();
  final modeloEquipamentoTextController = TextEditingController();
  final senhaEquipamentoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
        children: [
          Text('Equipamento'),
          CustomTextField(
            title: 'Modelo do Equipamento',
            hint: 'EX: desc...',
            controller: modeloEquipamentoTextController,
          ),
          CustomTextField(
              title: 'Serial Equipamento',
              hint: 'EX: serial ...',
              controller: serialEquipamentoTextController),
          CustomTextField(
              title: 'Senha Equipamento',
              hint: 'EX: senha ...',
              controller: senhaEquipamentoTextController),
          CustomTextArea(
              title: 'Descrição do problema',
              hint: 'Ex: Não liga',
              controller: descProblemaTextController),
          Column(
            children: [
              CustomButton(
                child: Text('Cadastrar'),
                onPressed: () => {
                  OSController().lancarOS(
                      OrdemServico(
                          "04-05-2000",
                          "aberta",
                          "04-05-2000",
                          descProblemaTextController.text,
                          senhaEquipamentoTextController.text),
                      Equipamento(modeloEquipamentoTextController.text,
                          serialEquipamentoTextController.text, 00))
                },
                style: CustomButton.SUCCESS,
              ),
              CustomButton(
                child: Text('Cancelar'),
                onPressed: () => {print('Cancelar')},
                style: CustomButton.DEFAULT,
              ),
            ],
          )
        ],
      )),
    );
  }
}
