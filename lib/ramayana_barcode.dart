// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ScanBarcode extends StatefulWidget {
  const ScanBarcode({super.key});

  @override
  State<ScanBarcode> createState() => _ScanBarcode();
}

class _ScanBarcode extends State<ScanBarcode> {
  // DatabaseInstance databaseInstance = DatabaseInstance();

  TextEditingController skuController = TextEditingController();
  TextEditingController kodeLokasiController = TextEditingController();
  TextEditingController kodeTokoController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  var savedData = [];

  getSavedData() async {
    var data = await Data.getData();
    // setelah data didapat panggil setState agar data segera dirender
    setState(() {
      savedData = data;
    });
  }

  // void dispose() {
  //   myController.dispose();
  //   super.dispose();
  // }

  var dio = Dio();
  late Size ukuranLayar;
  var akses = 'usr';

  @override
  void initState() {
    // databaseInstance.database();

    dateInput.text = ""; //set the initial value of text field
    super.initState();
    getSavedData();
  }

  String _scanBarcode = '';

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  String _scanBarcode2 = '';

  Future<void> startBarcodeScanStream2() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcode2() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode2 = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scan'),
          backgroundColor: const Color.fromARGB(255, 255, 17, 17),
          elevation: 7.20,
          toolbarHeight: 75,
        ),
        body: Stack(children: <Widget>[
          Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              width: 500,
              child: ListView(
                children: <Widget>[
                  Container(color: const Color.fromARGB(255, 227, 0, 0)),
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: 500,
                      height: 50,
                      color: const Color.fromARGB(255, 239, 237, 237),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        child: const Text(
                          'Tambah Barang',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: Colors.black),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  const Text(
                    'Kode Toko',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 17, 17),
                    ),
                  ),
                  TextField(
                    controller: kodeTokoController,
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kode Lokasi',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 17, 17),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        // width: 300,
                        // height: 40,
                        child: MaterialButton(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: const Color.fromARGB(255, 255, 17, 17),
                            onPressed: () => scanBarcode2(),
                            child: const Text(
                              'Scan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                  ),
                  TextField(
                    controller: kodeLokasiController..text = '$_scanBarcode2\n',
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'No. SKU',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 17, 17),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        // width: 300,
                        // height: 40,
                        child: MaterialButton(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: const Color.fromARGB(255, 255, 17, 17),
                            onPressed: () => scanBarcode(),
                            child: const Text(
                              'Scan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ],
                  ),
                  TextField(
                    controller: skuController..text = '$_scanBarcode\n',
                  ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  const Text(
                    'Quantity',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 17, 17),
                    ),
                  ),
                  const TextField(
                      //controller: ,
                      ),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  const Text(
                    'Tanggal',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 17, 17),
                    ),
                  ),
                  TextField(
                      controller: dateInput,
                      decoration: const InputDecoration(
                          // icon: Icon(Icons.calendar_today), //icon of text field
                          // labelText: "Enter Date" //label text of field
                          ),
                      // readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      }),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 17, 17),
                      //  borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return ListAct();
                        // }));
                        // var formData = FormData.fromMap({
                        //   'nik': controller_nik.text,
                        //   'fullname': controller_fullname.text,
                        //   'subdivisi': controller_subdivisi.text,
                        //   'date_visit ': controller_date_visit.text,
                        //   'location': controller_location.text,
                        //   'status': controller_status.text,
                        //   'description': controller_description.text,
                        //   'target': controller_target.text,
                        //   'stk_numbers': controller_stk_numbers.text
                        //   // 'data_gambar': await MultipartFile.fromFile(
                        //   //   _image?.path,
                        //   //   filename: 'data_gambar${now.toString()}.png'
                        //   // ),
                        // });
                        // var response = await dio.post('http://ramayana.joeloecs.com/mobileapi/tambah_act.php',
                        //     data: formData
                        // );
                        //print('Berhasil, ${controller_nik.text}, ${controller_fullname.text}, ${controller_subdivisi.text}, ${controller_date_visit.text}, ${controller_location.text}, ${controller_status.text}, ${controller_description.text}, ${controller_target.text}, ${controller_stk_numbers.text}, ');
                      },
                    ),
                  )
                ],
              ))
        ]));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController myinput = TextEditingController();
  @override
  void initState() {
    myinput.text = "This is the default text";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Read only TextField"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: TextField(
              controller: myinput,
              readOnly: true,
            ),
          ),
        ));
  }
}
