import 'package:gestao_tads/view/cadastro.view.dart';
import 'package:gestao_tads/view/grupos.view.dart';
import 'package:gestao_tads/view/login.view.dart';
import 'package:gestao_tads/view/permissoes.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
