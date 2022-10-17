// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:belajar_flutter_2/database/database_pdt.dart';
import 'package:belajar_flutter_2/models/model_pdt.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
// import 'package:universal_html/html.dart';
import 'data.dart';
import 'dart:async';

class FormAct extends StatefulWidget {
  final Activityy? activityy;

  const FormAct({super.key, this.activityy});

  @override
  _FormActState createState() => _FormActState();
}

class _FormActState extends State<FormAct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DbHelper db = DbHelper();

  TextEditingController? idAct;
  TextEditingController? kodeToko;
  TextEditingController? kodeLokasi;
  TextEditingController? noSku;
  TextEditingController? quantity;
  TextEditingController? tanggal;

  @override
  void initState() {
    kodeToko = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.kodeToko);

    kodeLokasi = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.kodeLokasi);

    noSku = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.noSku);

    quantity = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.quantity);

    tanggal = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.tanggal);

    super.initState();
  }

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

  void initStateDate() {
    // databaseInstance.database();

    tanggal!.text = ""; //set the initial value of text field
    super.initState();
    getSavedData();
  }

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

    setState(() {});
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
        title: const Text('Ramayana Scan'),
        backgroundColor: const Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20,
        toolbarHeight: 75,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(color: const Color.fromARGB(255, 227, 0, 0)),
            Container(
                margin: const EdgeInsets.only(top: 10),
                width: 500,
                height: 50,
                color: const Color.fromARGB(255, 239, 237, 237),
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  child: const Text('Tambah Barang'
                      //  '$_counter time${_counter == 1 ? '' : 's'}.',
                      ),
                )),
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
            TextFormField(
                validator: RequiredValidator(errorText: "Required"),
                controller: tanggal,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    // icon: Icon(Icons.calendar_today), //icon of text field
                    // labelText: "Enter Date" //label text of field
                  ),
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
                      tanggal!.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                }),
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
            TextFormField(
              validator: RequiredValidator(errorText: "Required"),
              controller: kodeToko,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )),
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
                MaterialButton(
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
              ],
            ),
            TextFormField(
              validator: RequiredValidator(errorText: "Required"),
              controller: kodeLokasi!..text = '$_scanBarcode2\n',
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )),
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
                MaterialButton(
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
              ],
            ),
            TextFormField(
              validator: RequiredValidator(errorText: "Required"),
              controller: noSku!..text = '$_scanBarcode2\n',
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )),
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
            TextFormField(
              validator: RequiredValidator(errorText: "Required"),
              controller: quantity,
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: MaterialButton(
                height: 50,
                color: const Color.fromARGB(255, 255, 17, 17),
                child: (widget.activityy == null)
                    ? const Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      )
                    : const Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                onPressed: () {
                  setState(() {});
                  setState(() {
                    _scanBarcode2 = noSku!.text;
                  });
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(
                          'Validation Successful',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                    upsertActivityy();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> upsertActivityy() async {
    if (widget.activityy != null) {
      //update
      await db.updateActivityy(Activityy.fromMap({
        'id_act': widget.activityy!.idAct,
        'kode_toko': kodeToko!.text,
        'kode_lokasi': kodeLokasi!.text,
        'no_sku': noSku!.text,
        'quantity': quantity!.text,
        'tanggal': tanggal!.text,
      }));
      // ignore: use_build_context_synchronously
      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveActivityy(Activityy(
        kodeToko: kodeToko!.text,
        kodeLokasi: kodeLokasi!.text,
        noSku: noSku!.text,
        quantity: quantity!.text,
        tanggal: tanggal!.text,
      ));
      // Navigator.pop(context, 'save');
    }
  }
}
