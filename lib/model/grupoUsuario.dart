class GrupoUsuario{
  int id;
  int valorGrupo_usuario;
  int permicao_usuario;
  int grupo_usuario;

  GrupoUsuario(this.valorGrupo_usuario,this.permicao_usuario,this.grupo_usuario);


  GrupoUsuario.fromMap(Map map) {
    id = map["id"];
    valorGrupo_usuario = map["valorGrupo_usuario"];
    permicao_usuario = map["permicao_usuario"];
    grupo_usuario = map["grupo_usuario"];
  }


  Map toMap() {
    Map<String, dynamic> map =  {
      "id" : id,
      "valorGrupo_usuario" : valorGrupo_usuario,
      "permicao_usuario" : permicao_usuario,
      "grupo_usuario" : grupo_usuario,
    };
    return map;
  }



}