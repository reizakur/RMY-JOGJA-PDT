class RamayanaModel {

    String? sku, kode_lokasi, kode_toko, date;
    RamayanaModel(
    {this.sku, this.kode_lokasi, this.kode_toko, this.date}
        );
    factory RamayanaModel.fromJson(Map<String, dynamic> json) {
      return RamayanaModel(
        sku: json['sku'],
        kode_lokasi: json['kode_lokasi'],
        kode_toko: json['kode_toko'],
        date: json['date']
      );
    }
}