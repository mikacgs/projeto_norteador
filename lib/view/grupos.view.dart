import 'package:gestao_tads/model/permissao.dart';
import 'package:gestao_tads/view/components/CustomTextField.dart';
import 'package:gestao_tads/view/components/DinamicListView.dart';
import 'package:gestao_tads/view/components/SimpleListView.dart';
import 'package:flutter/material.dart';

import 'components/CustomBackground.dart';
import 'components/CustomButton.dart';

class TelaGrupos extends StatefulWidget {
  @override
  State<TelaGrupos> createState() => _TelaGrupos();
}

class _TelaGrupos extends State<TelaGrupos> {
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
          child: Column(
        children: [
          CustomTextField(title: 'Nome', hint: 'EX: nome do grupo'),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Column(
              children: [
                Row(
                  children: [
                    DropDownWidget(),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 100,
                      child: CustomButton(
                        style: CustomButton.SUCCESS,
                        child: Text('ADD'),
                        onPressed: () => {
                          setState(() {
                            permissoes.removeLast();
                          })
                        },
                      ),
                    )
                  ],
                ),
                SimpleListView(
                  items: _listItems(permissoes),
                )
              ],
            ),
          )
        ],
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
          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          decoration: BoxDecoration(
            color: Colors.blueGrey[alvo - faixa * controle * -1],
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[alvo - faixa * controle],
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Text(
                  item.id.toString(),
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  child: Text(
                    item.descricao,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomButton(
                  child: Text('-'),
                  style: CustomButton.ERROR,
                  onPressed: () => {print('list click')},
                ),
              )
            ],
          ),
        ),
      );
    }
    return list;
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with DropDownWidget.
class _MyStatefulWidgetState extends State<DropDownWidget> {
  String dropdownValue = 'Gerenciar usuários';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Gerenciar usuários', 'Gerenciar ordens']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
