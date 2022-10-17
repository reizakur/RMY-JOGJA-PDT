// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:belajar_flutter_2/ramayana_login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Reg extends StatefulWidget {
  const Reg({super.key});

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
  final controllerNamaUser = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerSubdivisi = TextEditingController();

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
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 168, 3, 3),
            ),
          ),
          ListView(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 80, 20, 0),
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
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                    const SizedBox(height: 10),
                    TextField(
                      controller: controllerNamaUser,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 10),

                    TextField(
                      controller: controllerPassword,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 10),

                    TextField(
                      controller: controllerSubdivisi,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        labelText: 'Subdivisi',
                      ),
                    ),

                    const SizedBox(height: 10),
                    MaterialButton(
                        padding: const EdgeInsets.symmetric(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        color: Colors.red,
                        onPressed: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const AddActivity();
                          }));
                          var formData = FormData.fromMap({
                            'nama_user': controllerNamaUser.text,
                            'password': controllerPassword.text,
                            'subdivisi': controllerSubdivisi.text,

                            // 'data_gambar': await MultipartFile.fromFile(
                            //   _image?.path,
                            //   filename: 'data_gambar${now.toString()}.png'
                            // ),
                          });
                          await dio.post(
                              'http://ramayana.joeloecs.com/mobileapi/tambah_user.php',
                              data: formData);
                          print(
                              'Berhasil, ${controllerNamaUser.text}, ${controllerPassword.text}, ${controllerSubdivisi.text},');
                        },
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
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
