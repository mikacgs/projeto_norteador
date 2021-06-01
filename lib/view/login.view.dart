import 'package:gestao_tads/control/LoginController.dart';
import 'package:gestao_tads/model/usuario.dart';
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
  final emailTextController = TextEditingController();
  final senhaTextController = TextEditingController();

  @override
  void dispose() {
// Clean up the controller when the widget is disposed.
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      body: Center(
          child: Column(
        children: [
          CustomTextField(
              title: 'E-mail ',
              hint: 'email@dominio.com',
              controller: emailTextController),
          CustomTextField(
            title: 'Senha',
            hint: 'Senha ...',
            obscureText: true,
            controller: senhaTextController,
          ),
          Column(
            children: [
              CustomButton(
                child: Text('Login'),
                onPressed: () => {

                  print(emailTextController.text),
                  LoginController(
                          emailTextController.text, senhaTextController.text)
                      .autenticar(context)
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
