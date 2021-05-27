class Usuario {
  int id;
  int id_grupo;
  String usuario;
  String email;
  String cpf;
  String nascimento;
  String endereco;

  Map toMap() {
    Map map = Map();
    map['id'] = id;
    map['id_grupo'] = id_grupo;
    map['usuario'] = usuario;
    map['email'] = email;
    map['cpf'] = cpf;
    map['nascimento'] = nascimento;
    map['endereco'] = endereco;
    return map;
  }

  Usuario.fromMap(Map map) {
    this.id = map['id'];
    this.id_grupo = map['id_grupo'];
    this.usuario = map['usuario'];
    this.email = map['email'];
    this.cpf = map['cpf'];
    this.nascimento = map['nascimento'];
    this.endereco = map['endereco'];
  }
}
