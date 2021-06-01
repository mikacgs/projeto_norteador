import 'package:flutter/material.dart';
import 'package:gestao_tads/control/CadastroUsuarioController.dart';
import 'package:gestao_tads/model/usuario.dart';

import 'components/CustomBackground.dart';

class TelaUsuario extends StatefulWidget {
  @override
  _TelaUsuarioState createState() => _TelaUsuarioState();
}

class _TelaUsuarioState extends State<TelaUsuario> {
  List<Usuario> permissoes;

  _TelaUsuarioState() {
    CadastroUsuarioController().buscarUsuarios().then((value) => {
          setState(() {
            permissoes.addAll(value);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    permissoes = [];

    return CustomBackground(
      body: Center(
        /*child: SimpleListView(
        items: _listItems(permissoes),*/
        child: Text(
            "Deveria montar uma lista com o retorno da função: CadastroUsuarioController().getUsuarios()"),
      ),
    );
  }

  static List<Widget> _listItems(List<Usuario> items) {
    List<Widget> list = [];
    int controle = 1;
    int faixa = 100;
    int alvo = 200;
    for (Usuario item in items) {
      controle = controle * -1;

      list.add(
        Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            color: Colors.blueGrey[alvo - faixa * controle],
            child: Row(
              children: [
                Padding(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[alvo - faixa * controle * -1],
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Text(
                      // Text(
                      item.id.toString(),
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                ),
                Padding(
                  child: Text(item.usuario,
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                )
              ],
            )),
      );
    }
    return list;
  }
}
