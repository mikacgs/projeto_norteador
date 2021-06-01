
import 'package:flutter/material.dart';
import 'TelaCadastroEquipamento.dart';
import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';
import 'components/CustomTextField.dart';




class Equipamentos extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
            children: [
              CustomTextField(

                  title: 'Orden Serviço NRO: 001', hint: 'dell'),
              CustomTextField(title: 'Orden Serviço NRO: 002', hint: ''),
              CustomTextField(title: 'Orden Serviço NRO: 003', hint: ''),
              CustomTextField(title: 'Orden Serviço NRO: 004', hint: ''),

              Column(
                children: [
                  CustomButton(
                    child: Text('Pesquisar'),
                    onPressed: () => {print('Pesquisar')},
                    style: CustomButton.SUCCESS,
                  ),
                  CustomButton(
                    child: Text('Cadastrar'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CadEquip(),
                      ));
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
