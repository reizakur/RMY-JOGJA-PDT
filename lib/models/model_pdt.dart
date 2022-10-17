class Activityy {
  int? idAct;
  String? kodeToko;
  String? kodeLokasi;
  String? noSku;
  String? quantity;
  String? tanggal;

  Activityy({
    this.idAct,
    this.kodeToko,
    this.kodeLokasi,
    this.noSku,
    this.quantity,
    this.tanggal,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    if (idAct != null) {
      map['id_act'] = idAct;
    }
    map['kode_toko'] = kodeToko;
    map['kode_lokasi'] = kodeLokasi;
    map['no_sku'] = noSku;
    map['quantity'] = quantity;
    map['tanggal'] = tanggal;

    return map;
  }

  Activityy.fromMap(Map<String, dynamic> map) {
    idAct = map['id_act'];
    kodeToko = map['kode_toko'];
    kodeLokasi = map['kode_lokasi'];
    noSku = map['no_sku'];
    quantity = map['quantity'];
    tanggal = map['tanggal'];
  }
}
