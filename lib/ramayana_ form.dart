import 'package:belajar_flutter_2/ramayana_list_file.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';  
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {

  final controller_nik = TextEditingController();
  final controller_fullname = TextEditingController();
  final controller_subdivisi = TextEditingController();
  final controller_date_visit = TextEditingController();
  final controller_location = TextEditingController();
  final controller_status = TextEditingController();
  final controller_description = TextEditingController();
  final controller_target = TextEditingController();
  final controller_stk_numbers = TextEditingController();
  final controller_data_gambar = TextEditingController();

  var dio = Dio();
  late Size ukuranLayar;
  var akses = 'usr';

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Add Activity'),
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20  ,
          toolbarHeight: 75,
        ),   
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: Color.fromARGB(255, 253, 249, 249)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              width: 500,
              height: 50,
              color: Color.fromARGB(255, 239, 237, 237),
             
            ),
             Container(
                    margin: EdgeInsets.fromLTRB(30, 30,30, 0),
              child:
              Text(
                    'Tambah Barang', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23, color: Colors.black),
                    ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: ListView(

                children: <Widget>[
                  Text('No. SKU',
                  style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                  ),
                  TextField(
                    controller: controller_nik,
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                   Text('Kode Lokasi',
                  style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                  ),
                  TextField(
                    controller: controller_fullname,
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                     Text('Kode Toko',
                  style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                  ),
                  TextField(
                    controller: controller_subdivisi,
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                     Text('Quantity',
                  style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                  ),
                  TextField(
                    controller: controller_date_visit,
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                     Text('Tanggal',
                  style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), ),
                  ),
                    TextField(
                      controller: dateInput,
                      decoration: InputDecoration(
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
              },
                    ),

                 Container(
                 margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration( 
                   color: Color.fromARGB(255, 255, 17, 17),
                 //  borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                  TextButton(child: 
                  Text('Submit',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                  
                  ),
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ListAct();
                    }));
                    DateTime now = new DateTime.now();
                    var formData = FormData.fromMap({
                      'nik': controller_nik.text,
                      'fullname': controller_fullname.text,
                      'subdivisi': controller_subdivisi.text,
                      'date_visit ': controller_date_visit.text,
                      'location': controller_location.text,
                      'status': controller_status.text,
                      'description': controller_description.text,
                      'target': controller_target.text,
                      'stk_numbers': controller_stk_numbers.text
                      // 'data_gambar': await MultipartFile.fromFile(
                      //   _image?.path,
                      //   filename: 'data_gambar${now.toString()}.png'
                      // ),
                    });
                    var response = await dio.post('http://ramayana.joeloecs.com/mobileapi/tambah_act.php',
                      data: formData
                    );
                    print('Berhasil, ${controller_nik.text}, ${controller_fullname.text}, ${controller_subdivisi.text}, ${controller_date_visit.text}, ${controller_location.text}, ${controller_status.text}, ${controller_description.text}, ${controller_target.text}, ${controller_stk_numbers.text}, ');
                  },
                  ),
                 )
                ],
              ),
              )
          ]
          ),
    );
  }


DropdownMenuItem<String> buildMenuItem(String item) =>
  DropdownMenuItem(
    value: item,
    child: Text(
      item, 
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color.fromARGB(255, 255, 17, 17)),
    ),
  );


}