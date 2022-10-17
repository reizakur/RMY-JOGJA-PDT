import 'package:belajar_flutter_2/models/model_pdt.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  //inisialisasi beberapa variabel yang dibutuhkan
  final String tableName = 'tb_act';
  final String columnId = 'id_act';
  final String columnKodeToko = 'kode_toko';
  final String columnKodeLokasi = 'kode_lokasi';
  final String columnNoSku = 'no_sku';
  final String columnQuantity = 'quantity';
  final String columnTanggal = 'tanggal';

  DbHelper._internal();
  factory DbHelper() => _instance;

  //cek apakah database ada
  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'pdt.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //membuat tabel dan field-fieldnya
  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnKodeToko TEXT,"
        "$columnKodeLokasi TEXT,"
        "$columnNoSku TEXT,"
        "$columnQuantity TEXT,"
        "$columnTanggal TEXT)";

    await db.execute(sql);
  }

  //insert ke database
  Future<int?> saveActivityy(Activityy activityy) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, activityy.toMap());
  }

  //read database
  Future<List?> getAllFormat() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnKodeToko,
      columnKodeLokasi,
      columnNoSku,
      columnQuantity,
      columnTanggal,
    ]);

    return result.toList();
  }

  //update database
  Future<int?> updateActivityy(Activityy activityy) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, activityy.toMap(),
        where: '$columnId = ?', whereArgs: [activityy.idAct]);
  }

  //hapus database
  Future<int?> deleteActivityy(int idAct) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [idAct]);
  }
}
