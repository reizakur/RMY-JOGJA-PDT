// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'models/RamayanaModel.dart';

// class DatabaseInstance{
//   final String _databaseName = 'my_database.db';
//   final int _databaseVersion = 1;

//   // product Table
//   final String table = 'barang';
//   final String sku = 'sku';
//   final String kode_lokasi = 'kode_lokasi';
//   final String kode_toko = 'nama_toko';
//   final String date = 'date';

//   Database? _database;
//   Future<Database> database() async {
//     if(_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future _initDatabase() async{
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute(
//         'CREATE TABLE $table ($sku INTEGER PRIMARY KEY, $kode_lokasi INTEGER, $kode_toko INTEGER, $date DATE)'
//     );
//   }

//   Future<List<RamayanaModel>> all() async {
//     final data = await _database!.query(table);
//     List<RamayanaModel> result = data.map((e) => RamayanaModel.fromJson(e)).toList();
//     return result;
//   }

//   Future<int> insert(Map<String, dynamic> row) async {
//     final query = await _database!.insert(table, row);
//     return query;
//   }
// }