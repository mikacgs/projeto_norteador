class Usuario {
  int id;
  int id_grupo;
  String senha;
  String usuario;
  String email;
  String cpf;
  String nascimento;
  String endereco;

  Usuario(this.id, this.id_grupo, this.usuario, this.email, this.cpf,
      this.nascimento, this.endereco);

  Usuario.registrar(this.usuario, this.senha, this.email, this.cpf,
      this.nascimento, this.endereco);

  Map toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'id_grupo': id_grupo,
      'senha': senha,
      'usuario': usuario,
      'email': email,
      'cpf': cpf,
      'nascimento': nascimento,
      'endereco': endereco,
    };
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
