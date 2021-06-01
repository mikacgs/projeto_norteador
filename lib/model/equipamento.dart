class Equipamento {
  int id;
  String descequipamentos;
  String serieequipamentos;
  int valorequipamentos;

  Equipamento(this.descequipamentos,this.serieequipamentos,this.valorequipamentos);


  Equipamento.fromMap(Map map) {
   // id = map["id"];
    descequipamentos = map["descequipamentos"];
    serieequipamentos = map["serieequipamentos"];
    valorequipamentos = map["valorequipamentos"];
  }


  Map toMap() {
    Map<String, dynamic> map =  {
     // "id" : id!=null?id:"0",
      "descequipamentos" : descequipamentos,
      "serieequipamentos" : serieequipamentos,
      "valorequipamentos" : valorequipamentos,

    };
    return map;
  }
}