import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  Widget _content;
  CustomBackground({Widget body}) {
    this._content = body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        title: Text('Teste'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {
                  // Chame o Navigator aqui para voltar a rota precedente
                }),
      ),
      backgroundColor: Colors.blue[200],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 250, 250, 1),
              border: Border.all(),
            ),
            child: _content,
          ),
        ),
      ),
    );
  }
}
