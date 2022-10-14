import 'package:belajar_flutter_2/ramayana_home.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_2/form_pdt.dart';
import 'package:belajar_flutter_2/database/database_pdt.dart';
import 'package:belajar_flutter_2/models/model_pdt.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Stack, Column, Row;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';


class ListActivityPage extends StatefulWidget {
  const ListActivityPage({Key? key}) : super(key: key);

  @override
  _ListActivityPageState createState() => _ListActivityPageState();
}

class _ListActivityPageState extends State<ListActivityPage> {

  List<Activityy> listActivity = [];
 
  DbHelper db = DbHelper();

  @override
  void initState() {
    //menjalankan fungsi getallkontak saat pertama kali dimuat
    _getAllActivity();
    super.initState();
  } 

               Future<void> createExcel() async {

              //ini bukan ya pak yg buat ngehubung ke excel
   
                final Workbook workbook = Workbook();
                final Worksheet sheet = workbook.worksheets[0];
   for (int i =0; i < listActivity.length; i++){
    print('test');
                sheet.getRangeByName('A1').columnWidth = 10;
                sheet.getRangeByName('B1').columnWidth = 14;
                sheet.getRangeByName('C1').columnWidth = 17;
                sheet.getRangeByName('D1').columnWidth = 17;
                sheet.getRangeByName('E1').columnWidth = 10;

                sheet.getRangeByName('A1').setText('Tanggal');
                sheet.getRangeByName('B1').setText('Kode Toko');
                sheet.getRangeByName('C1').setText('Kode Lokasi');
                sheet.getRangeByName('D1').setText('No. SKU'); 
                sheet.getRangeByName('E1').setText('Quantity');
            }  
   
                // sheet.getRangeByName('A2').setText('${activityy.tanggal}');
                // sheet.getRangeByName('B2').setText('${activityy.kode_toko}');
                // sheet.getRangeByName('C2').setText('${activityy.kode_lokasi}');
                // sheet.getRangeByName('D2').setText('${activityy.no_sku}');
                // sheet.getRangeByName('E2').setText('${activityy.quantity}');

                
                final List<int> bytes = workbook.saveAsStream();
                workbook.dispose();

                if (kIsWeb) {
                  AnchorElement(
                      href:
                          'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
                    ..setAttribute('download', 'Output.xlsx')
                    ..click();
                } else {
                  final String path = (await getApplicationSupportDirectory()).path;
                  final String fileName =
                      Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
                  final File file = File(fileName);
                  await file.writeAsBytes(bytes, flush: true);
                  OpenFile.open(fileName);
                }
              }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  AppBar(
        actions: [
          IconButton(
            onPressed: () {
             createExcel();
                    
            }, 
          icon: Icon(Icons.print_rounded)
          )
        ],
        title: Text('Ramayana List', style: TextStyle(fontSize: 23)),
        leading: IconButton(
          icon: Icon(Icons.home, 
          size: 30,
          ),
          onPressed: (() {
            Navigator.push(context, MaterialPageRoute(builder: (context){
            return Ramayana();
            }));
          }
        ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20  ,
          toolbarHeight: 90,
        ),
        
      body: Stack(
        
        children: <Widget>[
        
          Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: 150,
            // width: 500,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 232, 15, 15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 3,
                  blurRadius: 3,
                )
              ],
            )
        ),

        Container(
            margin: EdgeInsets.only(left: 10, top: 20),
            child: Text('List Activity',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)
            ),
        ),

        Container(
            margin: EdgeInsets.only(left: 230, top: 90),
            child: Text('Adhelia Putri Wardhana',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)
            )
        ),

        Container(
          margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
          height: 70,

          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              Text('ALL',
                  style: TextStyle(
                      color: Color.fromARGB(221, 101, 89, 89),
                      fontSize: 17,
                      fontWeight: FontWeight.w700)),
              Text('TRASH',
                  style: TextStyle(
                      color: Color.fromARGB(221, 101, 89, 89),
                      fontSize: 17,
                      fontWeight: FontWeight.w700))
            ],
          ),
        ),

      Container(
        margin: EdgeInsets.only(top: 190 ),
         decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5)
            ],
          ),
        child:  
      ListView.builder(
          itemCount: listActivity.length,
          itemBuilder: (context, index) {
            Activityy activityy = listActivity[index];
            
           
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading:  Text('${activityy.kode_toko}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),) ,
                title: Text('${activityy.no_sku}', 
                      style: TextStyle(
                      color: Color.fromARGB(255, 255, 17, 17), fontWeight: FontWeight.w500, fontSize: 20)),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                                      
                    
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 1,
                      ),
                      child: Text("Kode Lokasi: ${activityy.kode_lokasi}",
                      style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 1,
                      ),
                      child: Text("Quantity: ${activityy.quantity}",
                      style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 1,
                      ),
                      child: Text("Tanggal: ${activityy.tanggal}",
                      style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15)),
                    ),
                    
                  ],
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      // button edit
                      IconButton(
                          onPressed: () {
                            _openFormEdit(activityy);
                          },
                          icon: Icon(Icons.edit),
                          color: Color.fromARGB(255, 255, 17, 17),
                          ),
                      // button hapus
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Color.fromARGB(255, 255, 17, 17),
                        onPressed: () {
                          //membuat dialog konfirmasi hapus
                          AlertDialog hapus = AlertDialog(
                            title: Text("Information"),
                            content: Row(
                              children: <Widget>[
                            Expanded(
                              child: Container(
                                // height: 70.0,
                                width: 300,
                                child: 
                                    Text(
                                        "Yakin hapus data ${activityy.no_sku}?")
                                  
                              ),
                            ),
                             ],),
                            //terdapat 2 button.
                            //jika ya maka jalankan _deleteKontak() dan tutup dialog
                            //jika tidak maka tutup dialog
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    _deleteActivity(activityy, index);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ya",
                                    style: TextStyle(
                                    color:  Color.fromARGB(255, 255, 17, 17), fontWeight: FontWeight.w500, fontSize: 17)
                                  )
                                    ),
                                  
                              TextButton(
                                child: Text('Tidak',
                                    style: TextStyle(
                                    color:  Color.fromARGB(255, 255, 17, 17), fontWeight: FontWeight.w500, fontSize: 17)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                          showDialog(
                              context: context, builder: (context) => hapus);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      )
      
      ],),
      
      //membuat button mengapung di bagian bawah kanan layar
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        child: Icon(Icons.add),
        onPressed: () {
          _openFormCreate();
        },
      ),
    );
  }

  //mengambil semua data Kontak
  Future<void> _getAllActivity() async {
    //list menampung data dari database
    var list = await db.getAllFormat();

    //ada perubahanan state
    setState(() {
      //hapus data pada listKontak
      listActivity.clear();

      //lakukan perulangan pada variabel list
      list!.forEach((activityy) {
        //masukan data ke listKontak
        listActivity.add(Activityy.fromMap(activityy));
      });
    });
  }

  //menghapus data Kontak
  Future<void> _deleteActivity(Activityy activityy, int position) async {
    await db.deleteActivityy(activityy.id_act!);
    setState(() {
      listActivity.removeAt(position);
    });
  }

  // membuka halaman tambah Kontak
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormAct()));
    if (result == 'save') {
      await _getAllActivity();
    }
  }

  //membuka halaman edit Kontak
  Future<void> _openFormEdit(Activityy activityy) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormAct(activityy: activityy)));
    if (result == 'update') {
      await _getAllActivity();
    }
  }
}

