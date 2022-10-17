class AktivitasUser {
  AktivitasUser.init() {
    nama_user = 'Coffe Name';
  }

  // ignore: non_constant_identifier_names
  late String id_user, nama_user, password, subdivisi;
  // late int qty;

  AktivitasUser.fromjson(Map<String, dynamic> json) {
    id_user = json["id_user"];
    nama_user = json["nama_user"];
    password = json["password"];
    subdivisi = json["subdivisi"];
    // this.qty = json["qty"] == '' ? 0 : int.parse(json["qty"]);
  }
  static List<AktivitasUser> aktivitaslistuser = [];
}
