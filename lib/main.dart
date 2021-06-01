import 'package:gestao_tads/view/TelaCadastroUsuario.view.dart';

import 'package:gestao_tads/model/gestao.dart';
import 'package:gestao_tads/view/TelaLogin.view.dart';
import 'package:gestao_tads/view/TelaListarPermissoes.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
Gestao gestao = Gestao();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demonstration',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: TelaLogin());
  }
}
//acho que agora foi

//foi sim
//Eu n sei nem por onde começar kkkkkkkkk
//bem nessas kkkkkkkkk
//Em qual aula ele ensina a pegar variavel dos input ??
//acho que é no encontro 6/5
//o penultimo
//os models que eu tinha feito são estes, tem que ver se tem, que alterar algo

//Acho que é isso msm
/*
Vou ir tentando fazer alguma coisa aqui kkkkkkkk
e ver se aquelas minhas model la vao funcionar o map tá bem diferente
Tu já passou as tuas views pra cá ??
//ainda não
//vou passar agora
Aí é só linkar ela ali na main.view.dart
As telas que vão ter inputs tem que ser statefull ou eu crio uma classe abaixo pra controlar ?
boa pergunta
estou assistendo a ultima aula aqui para ver
tem que importar o http no pubspec
ele deu um erro aqui nas dependencias
no slide de requisições http no moodle mostra que tem que fazer uma import
Acho que foi agora
Vamos fazer uma classe só pra controlar os request ou fazer separado por endpoint ??
como tu achar melhor cara
 */