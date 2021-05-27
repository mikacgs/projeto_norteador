class Permissao {
  int _id;
  String _descricao;

  Map toMap() {
    Map map = Map();
    map['id'] = id;
    map['descricao'] = descricao;
    return map;
  }

  Permissao.fromMap(Map map) {
    this._id = map['id'];
    this.descricao = map['descricao'];
  }
  int get id {
    return this._id;
  }

  set id(int id) {
    this._id = id;
  }

  String get descricao {
    return this._descricao;
  }

  set descricao(String descricao) {
    this._descricao = descricao;
  }

  Permissao(int id, String descricao) {
    print(id);
    this._id = id;
    this._descricao = descricao;
  }
}
