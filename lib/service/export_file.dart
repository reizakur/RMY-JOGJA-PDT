import 'package:belajar_flutter_2/models/model_pdt.dart';
import 'package:belajar_flutter_2/service/database_pdt.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ExportFile {
  ExportFile({required this.db});

  late DbHelper db;
  Future<String> writeToFile() async {
    final file = await _localFile;
    String dataset = await _importFromDB();
    file.writeAsString(dataset);
    return file.path;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    DateTime current = DateTime.now();
    return File('$path/export_${current.toString()}.txt');
  }

  Future<String> _importFromDB() async {
    List<Activityy> listActivity = [];
    var list = await db.getAllFormat();

    for (var activityy in list!) {
      listActivity.add(Activityy.fromMap(activityy));
    }

    String result = '';
    for (var activityy in listActivity) {
      result =
          '${activityy.kodeToko!},${activityy.kodeLokasi!},${activityy.noSku!},${activityy.quantity!},${activityy.tanggal!}\n$result';
    }
    return result;
  }
}
