// ignore_for_file: library_private_types_in_public_api

import 'package:belajar_flutter_2/ramayana_home.dart';
import 'package:belajar_flutter_2/ramayana_regristrasi.dart';
import 'package:flutter/material.dart';

class AddActivity extends StatefulWidget {
  const AddActivity({super.key});

  @override
  _AddActivity createState() => _AddActivity();
}

class _AddActivity extends State<AddActivity> {
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
                    const TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      obscureText: true,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Pasword ?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Ramayana();
                        }));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 85),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            'Belum Punya Akun?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Reg();
                                }));
                              },
                              child: const Text(
                                'Daftar',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    )
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
