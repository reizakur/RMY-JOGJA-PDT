class Activityy {
  int? id_act;
  String? kode_toko;
  String? kode_lokasi;
  String? no_sku;
  String? quantity;
  String? tanggal;

  Activityy({
    this.id_act,
    this.kode_toko,
    this.kode_lokasi,
    this.no_sku,
    this.quantity,
    this.tanggal,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id_act != null) {
      map['id_act'] = id_act;
    }
    map['kode_toko'] = kode_toko;
    map['kode_lokasi'] = kode_lokasi;
    map['no_sku'] = no_sku;
    map['quantity'] = quantity;
    map['tanggal'] = tanggal;

    return map;
  }

  Activityy.fromMap(Map<String, dynamic> map) {
    this.id_act = map['id_act'];
    this.kode_toko = map['kode_toko'];
    this.kode_lokasi = map['kode_lokasi'];
    this.no_sku = map['no_sku'];
    this.quantity = map['quantity'];
    this.tanggal = map['tanggal'];
  }
}
