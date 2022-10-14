import 'package:flutter/material.dart';
import 'package:belajar_flutter_2/database/database_pdt.dart';
import 'package:belajar_flutter_2/list_pdt.dart';
import 'package:image_picker/image_picker.dart';
import 'package:belajar_flutter_2/models/model_pdt.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'data.dart';

class FormAct extends StatefulWidget {
  final Activityy? activityy;

  FormAct({this.activityy});

  @override
  _FormActState createState() => _FormActState();
}

class _FormActState extends State<FormAct> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DbHelper db = DbHelper();

  TextEditingController? id_act;
  TextEditingController? kode_toko;
  TextEditingController? kode_lokasi;
  TextEditingController? no_sku;
  TextEditingController? quantity;
  TextEditingController? tanggal;

  @override
  void initState() {
    kode_toko = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.kode_toko);

    kode_lokasi = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.kode_lokasi);

    no_sku = TextEditingController(
        text: widget.activityy == null ? '' : widget.activityy!.no_sku);

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

  @override
  // void dispose() {
  //   myController.dispose();
  //   super.dispose();
  // }

  var dio = Dio();
  late Size ukuranLayar;
  var akses = 'usr';

  @override
  void initStateDate() {
    // databaseInstance.database();

    tanggal!.text = ""; //set the initial value of text field
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
          title: Text('Ramayana Scan'),
          backgroundColor: Color.fromARGB(255, 255, 17, 17),
          elevation: 7.20  ,
          toolbarHeight: 75,
        ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [

                       Container(
                          color: Color.fromARGB(255, 227, 0, 0)
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 500,
                          height: 50,
                          color: Color.fromARGB(255, 239, 237, 237),
                          child:
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 20),
                            child:
                            Text(
                              'Tambah Barang', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: Colors.black),
                            ),
                          )
                      ),

                  SizedBox(
                        height: 20,
                        width: 20,
                      ),

                      

            
                    Text(
                      'Tanggal',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 17, 17),
                      ),
                    ),

                     TextFormField(
                       validator: RequiredValidator(errorText: "Required"),
                          controller: tanggal,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
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
                          }
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),

                  Text('Kode Toko',
                        style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                      ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "Required"),
                    controller: kode_toko,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                        )
                  ),
                  ),
                
            
            SizedBox(
                        height: 20,
                        width: 20,
                      ),


                  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Kode Lokasi',
                            style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                          ),
                          Container(  
                            child:
                            MaterialButton(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                color: Color.fromARGB(255, 255, 17, 17),
                                onPressed: () => scanBarcode(),
                                child:
                                Text('Scan',
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                                )
                            ),
                          ),
                        ],
                      ),

                    TextFormField(
                        validator: RequiredValidator(errorText: "Required"),
                        controller: kode_lokasi!..text = '$_scanBarcode\n',
                         decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                        )
                  ),

                      ),

                      SizedBox(
                        height: 20,
                        width: 20,
                      ),    
                      
                      
            Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('No. SKU',
                            style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                          ),
                          Container(
                            
                            child:
                            MaterialButton(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                color: Color.fromARGB(255, 255, 17, 17),
                                onPressed: () => scanBarcode2(),
                                child:
                                Text('Scan',
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                                )
                            ),
                          ),
                        ],
                      ),

                      TextFormField(
                        validator: RequiredValidator(errorText: "Required"),
                        controller: no_sku!..text = '$_scanBarcode2\n',
                         decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                        )
                  ),
                      ),

                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
            Text('Quantity',
                        style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                      ),

                       TextFormField(
                        validator: RequiredValidator(errorText: "Required"),
                       controller: quantity,
                        decoration: InputDecoration(
                         enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                        )
                  ),
                      ),
            
                 

            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: MaterialButton(
                height: 50,
                color: Color.fromARGB(255, 255, 17, 17),
                child: (widget.activityy == null)
                    ? Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                onPressed: () {
                   setState(() {
                    _scanBarcode = kode_lokasi!.text;
                    
                  });
                  setState(() {
                    _scanBarcode2 = no_sku!.text;
                    
                  });
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
        'id_act': widget.activityy!.id_act,
        'kode_toko': kode_toko!.text,
        'kode_lokasi': kode_lokasi!.text,
        'no_sku': no_sku!.text,
        'quantity': quantity!.text,
        'tanggal': tanggal!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //insert
      await db.saveActivityy(Activityy(
        kode_toko: kode_toko!.text,
        kode_lokasi: kode_lokasi!.text,
        no_sku: no_sku!.text,
        quantity: quantity!.text,
        tanggal: tanggal!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
