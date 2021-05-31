import 'package:flutter/material.dart';
import 'Equipamentos.dart';
import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';
import 'components/CustomTextField.dart';

class CadEquip extends StatelessWidget {


  @override

  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
            children: [
              CustomTextField(title: 'Descrição Equipamento', hint: 'EX: desc...'),
              CustomTextField(title: 'Serial Equipamento', hint: 'EX: serial ...'),
              CustomTextField(title: 'Senha Equipamento', hint: 'EX: senha ...'),

              Column(
                children: [
                  CustomButton(
                    child: Text('Salvar'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Equipamentos (),
                      ));
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

