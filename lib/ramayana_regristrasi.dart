import 'dart:convert';

import 'package:belajar_flutter_2/ramayana_login.dart';
import 'package:belajar_flutter_2/models/models_user.dart';
import 'package:http/http.dart' as http;
import 'package:belajar_flutter_2/ramayana_home.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';  

class Reg extends StatefulWidget {
  @override
  _Reg createState() => _Reg();
}

class _Reg extends State<Reg> {
  //  void fetchProduk() async {
  //   AktivitasUser.aktivitaslistuser.clear();
  //   final responseku = await http.post(
  //       Uri.parse('http://ramayana.joeloecs.com/mobileapi/fetch_data_user.php'),
  //       body: {
  //         "id_act": 'nothing',
  //       });
  //   var data = jsonDecode(responseku.body);
  //   if (data[0]['result'] == '1') {
  //     int count = data[1].length;
  //     for (int i = 0; i < count; i++) {
  //       AktivitasUser.aktivitaslistuser.add(AktivitasUser.fromjson(data[1][i]));
  //     }
  //     print('check length ${AktivitasUser.aktivitaslistuser.length}');
  //     print(data[1].toString());
  //   } else {
  //     print('NO DATA');
  //   }
  //   setState(() {});
  // }

    // final controller_id_user = TextEditingController();
    final controller_nama_user = TextEditingController();
    final controller_password = TextEditingController();
    final controller_subdivisi = TextEditingController();

    var dio = Dio();
    late Size ukuranLayar;
    var akses = 'usr';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 900,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 168, 3, 3),
            ),
          ),
          ListView(
            children: [
          
          Container(
            margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
            height: 200,
            width: 400,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/ramayana.png",
                  height: 140,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: <Widget>[
                // TextField(
                //   controller: controller_id_user,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     prefixIcon: Icon(
                //       Icons.person,
                //       color: Colors.white,
                //     ),
                //     labelText: 'ID User',
                //   ),
                // ),
                SizedBox(height: 10),
                TextField(
                  controller: controller_nama_user,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelText: 'Username',
                  ),
                ),
                 SizedBox(height: 10),

                 TextField(
                  controller: controller_password,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.key,
                      color: Colors.white,
                    ),
                    labelText: 'Password',
                  ),
                ),
                 SizedBox(height: 10),
                 
                 TextField(
                  controller: controller_subdivisi,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    labelText: 'Subdivisi',
                  ),
                ),
                 
                SizedBox(height: 10),
                MaterialButton(
                  padding: EdgeInsets.symmetric(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                  onPressed: () async 
                     {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return AddActivity();
                    }));
                    DateTime now = new DateTime.now();
                    var formData = FormData.fromMap({
                      'nama_user': controller_nama_user.text,
                      'password': controller_password.text,
                      'subdivisi': controller_subdivisi.text,
                      
                      // 'data_gambar': await MultipartFile.fromFile(
                      //   _image?.path,
                      //   filename: 'data_gambar${now.toString()}.png'
                      // ),
                    });
                    var response = await dio.post('http://ramayana.joeloecs.com/mobileapi/tambah_user.php',
                      data: formData
                    );
                    print('Berhasil, ${controller_nama_user.text}, ${controller_password.text}, ${controller_subdivisi.text},');
                     }
                      
                  
                ),
              ],
            ),
          )
              ],
          ),

        ],
      ),
    );
  }
}
