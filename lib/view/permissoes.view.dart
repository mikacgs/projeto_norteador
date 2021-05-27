import 'package:gestao_tads/model/permissao.dart';
import 'package:gestao_tads/view/components/SimpleListView.dart';
import 'package:flutter/material.dart';

import 'components/CustomBackground.dart';

class TelaPermissao extends StatelessWidget {
  List<Permissao> permissoes;

  @override
  Widget build(BuildContext context) {
    permissoes = [];
    permissoes.add(Permissao(1, 'Adicionar usuarios'));
    permissoes.add(Permissao(2, 'Remover usuarios'));
    permissoes.add(Permissao(3, 'Listar usuarios'));
    permissoes.add(Permissao(4, 'Alterar usuarios'));
    return CustomBackground(
      body: Center(
          child: SimpleListView(
        items: _listItems(permissoes),
      )),
    );
  }

  static List<Widget> _listItems(List<Permissao> items) {
    List<Widget> list = [];
    int controle = 1;
    int faixa = 100;
    int alvo = 200;
    for (Permissao item in items) {
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
                  child: Text(item.descricao,
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
