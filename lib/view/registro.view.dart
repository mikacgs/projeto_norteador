import 'package:gestao_tads/control/ApiController.dart';
import 'package:gestao_tads/control/CadastroUsuarioController.dart';
import 'package:gestao_tads/model/usuario.dart';
import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:flutter/material.dart';

import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';
import 'components/CustomTextArea.dart';

class TelaRegistro extends StatefulWidget {
  _TelaRegistroState createState() => _TelaRegistroState();
}

class _TelaRegistroState extends State<TelaRegistro> {
  final nomeTextController = TextEditingController();
  final senhaTextController = TextEditingController();
  final CPFTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final nascimentoTextController = TextEditingController();
  final enderecoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
        children: [
          CustomTextField(
            title: 'Nome',
            hint: 'EX: meunome',
            controller: nomeTextController,
          ),
          CustomTextField(
              title: 'Senha',
              hint: 'EX: *************',
              controller: senhaTextController),
          CustomTextField(
              title: 'Email',
              hint: 'EX: email@email.com',
              controller: emailTextController),
          CustomTextField(
              title: 'CPF',
              hint: 'EX: 000.000.000-00 ...',
              controller: CPFTextController),
          CustomTextField(
              title: 'Data de Nascimento',
              hint: 'EX: 00/00/0000',
              controller: nascimentoTextController),
          CustomTextField(
            title: 'Endereço',
            hint: 'EX: Rua de teste, nº 0',
            controller: enderecoTextController,
          ),
          Column(
            children: [
              CustomButton(
                child: Text('Cadastrar'),
                onPressed: () => {
                  CadastroUsuarioController().adicionarUsuario(
                      Usuario.registrar(
                          nomeTextController.text,
                          senhaTextController.text,
                          emailTextController.text,
                          CPFTextController.text,
                          nascimentoTextController.text,
                          enderecoTextController.text))
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
