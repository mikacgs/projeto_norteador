import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:flutter/material.dart';

import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';
import 'components/CustomTextArea.dart';

class TelaRegistro extends StatelessWidget {
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
          Column(
            children: [
              CustomButton(
                child: Text('Cadastrar'),
                onPressed: () => {print('REGSITRAR')},
                style: CustomButton.SUCCESS,
              ),
            ],
          )
        ],
      )),
    );
  }
}
