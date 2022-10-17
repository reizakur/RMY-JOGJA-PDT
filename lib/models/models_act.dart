class AktivitasModel {
  AktivitasModel.init() {
    fullname = 'Coffe Name';
  }

  // ignore: non_constant_identifier_names
  late String id_act,
      fullname,
      subdivisi,
      location,
      status,
      description,
      target,
      dateVisit,
      stkNumber,
      dataGambar,
      idUser;
  // late int qty;

  AktivitasModel.fromjson(Map<String, dynamic> json) {
    id_act = json["id_act"];
    fullname = json["fullname"];
    subdivisi = json["subdivisi"];
    location = json["location"];
    // this.qty = json["qty"] == '' ? 0 : int.parse(json["qty"]);
    status = json["status"];
    description = json["description"];
    target = json["target"];
    dateVisit = json["date_visit"];
    stkNumber = json["stk_numbers"];
    dataGambar = json["data_gambar"];
    idUser = json["id_user"];
  }
  static List<AktivitasModel> aktivitaslist = [];
}
