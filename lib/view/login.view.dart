import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:gestao_tads/view/main.view.dart';
import 'package:gestao_tads/view/registro.view.dart';
import 'package:flutter/material.dart';
import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final userTextController = TextEditingController();

  @override
  void dispose() {
// Clean up the controller when the widget is disposed.
    userTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
        children: [
          CustomTextField(
              title: 'Nome',
              hint: 'Nome do usuário',
              controller: userTextController),
          CustomTextField(
            title: 'Senha',
            hint: 'Senha ...',
            obscureText: true,
          ),
          Column(
            children: [
              CustomButton(
                child: Text('Login'),
                onPressed: () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TelaPrincipal()))
                },
                style: CustomButton.SUCCESS,
              ),
              CustomButton(
                child: Text('Cadastrar'),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaRegistro()))
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
