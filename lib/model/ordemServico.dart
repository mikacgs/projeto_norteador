class OrdemServico {
  int id;
  String data;
  String status;
  String dataretirada;
  String descproblema;
  String senhaequip;

  OrdemServico(
      this.data,
      this.status,
      this.dataretirada,
      this.descproblema,
      this.senhaequip);

  OrdemServico.fromMap(Map map) {
   // id = map["id"];
    data = map["data"];
    status = map["status"];
    dataretirada = map["dataretirada"];
    descproblema = map["descproblema"];
    senhaequip = map["senhaequip"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
     // "id": id != null ? id : "0",
      "data": data,
      "status": status,
      "dataretirada": dataretirada,
      "descproblema": descproblema,
      "senhaequip": senhaequip,
    };
    return map;
  }
}
