// ignore_for_file: file_names, avoid_print

import 'package:belajar_flutter_2/ramayana_list_file.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  final controllerNik = TextEditingController();
  final controllerFullName = TextEditingController();
  final controllerSubdivisi = TextEditingController();
  final controllerDateVisit = TextEditingController();
  final controllerLocation = TextEditingController();
  final controllerStatus = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerTarget = TextEditingController();
  final controllerStkNumbers = TextEditingController();
  final controllerDataGambar = TextEditingController();

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
        title: const Text('Add Activity'),
        backgroundColor: const Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20,
        toolbarHeight: 75,
      ),
      body: Stack(children: <Widget>[
        Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: const Color.fromARGB(255, 253, 249, 249)),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          width: 500,
          height: 50,
          color: const Color.fromARGB(255, 239, 237, 237),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: const Text(
            'Tambah Barang',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 23, color: Colors.black),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 100, 30, 0),
          child: ListView(
            children: <Widget>[
              const Text(
                'No. SKU',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 17, 17),
                ),
              ),
              TextField(
                controller: controllerNik,
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              const Text(
                'Kode Lokasi',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 17, 17),
                ),
              ),
              TextField(
                controller: controllerFullName,
              ),
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
                controller: controllerSubdivisi,
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
              TextField(
                controller: controllerDateVisit,
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
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ListAct();
                    }));
                    var formData = FormData.fromMap({
                      'nik': controllerNik.text,
                      'fullname': controllerFullName.text,
                      'subdivisi': controllerSubdivisi.text,
                      'date_visit ': controllerDateVisit.text,
                      'location': controllerLocation.text,
                      'status': controllerStatus.text,
                      'description': controllerDescription.text,
                      'target': controllerTarget.text,
                      'stk_numbers': controllerStkNumbers.text
                      // 'data_gambar': await MultipartFile.fromFile(
                      //   _image?.path,
                      //   filename: 'data_gambar${now.toString()}.png'
                      // ),
                    });
                    await dio.post(
                        'http://ramayana.joeloecs.com/mobileapi/tambah_act.php',
                        data: formData);
                    print(
                        'Berhasil, ${controllerNik.text}, ${controllerFullName.text}, ${controllerSubdivisi.text}, ${controllerDateVisit.text}, ${controllerLocation.text}, ${controllerStatus.text}, ${controllerDescription.text}, ${controllerTarget.text}, ${controllerStkNumbers.text}, ');
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color.fromARGB(255, 255, 17, 17)),
        ),
      );
}
