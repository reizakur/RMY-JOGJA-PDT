// ignore_for_file: file_names

class RamayanaModel {
  // ignore: non_constant_identifier_names
  String? sku, kodeLokasi, kodeToko, date;
  RamayanaModel({this.sku, this.kodeLokasi, this.kodeToko, this.date});
  factory RamayanaModel.fromJson(Map<String, dynamic> json) {
    return RamayanaModel(
        sku: json['sku'],
        kodeLokasi: json['kode_lokasi'],
        kodeToko: json['kode_toko'],
        date: json['date']);
  }
}
