import 'package:belajar_flutter_2/ramayana_home.dart';
import 'package:belajar_flutter_2/ramayana_regristrasi.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddActivity extends StatefulWidget {
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
                TextField(
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
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Pasword ?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red,
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Ramayana();
                      }));
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 85),
                  child: 
                Row(
                  children: <Widget>[
                    Text('Belum Punya Akun?',
                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Reg();
                        }));
                      },
                       child: Text(
                        'Daftar',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                       )
                       )
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
