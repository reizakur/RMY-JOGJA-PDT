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
      // appBar: AppBar(
      //   title: Text('  Add Activity'),
      //   backgroundColor: Colors.red,
      //   elevation: 7.0,
      //   //leading: Icon(Icons.arrow_back),
      //   actions: <Widget>[
      //     // IconButton(
      //     //   icon: Icon(Icons.attach_money),
      //     //   onPressed: () {},
      //     // ),
      //     // IconButton(
      //     //   icon: Icon(Icons.attach_money),
      //     //   onPressed: () {},
      //     // ),
      //     // Container(
      //     //   margin: EdgeInsets.fromLTRB(20, 200, 20, 0),
      //     //   height: 20,
      //     //   decoration: BoxDecoration(
      //     //     color: Colors.green[200],
      //     //     borderRadius: BorderRadius.circular(50),
      //     //   ),
      //     // ),
      //     // IconButton(
      //     //   icon: Icon(Icons.power_settings_new_rounded),
      //     //   onPressed: () {},
      //     // ),
      //     // IconButton(
      //     //   icon: Icon(Icons.shopping_cart),
      //     //   onPressed: () {},
      //     // ),
      //     // PopupMenuButton(itemBuilder: (BuildContext context) {
      //     //   return [
      //     //     PopupMenuItem(child: Text('Menu1')),
      //     //     PopupMenuItem(child: Text('Menu2')),
      //     //     PopupMenuItem(child: Text('Menu3')),
      //     //   ];
      //     // })
      //   ],
      // ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 900,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 168, 3, 3),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          //   height: 50,
          //   width: 400,
          //   decoration: BoxDecoration(
          //     color: Color.fromARGB(255, 230, 230, 230),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         '  Form Activity',
          //         style: TextStyle(
          //           fontWeight: FontWeight.w900,
          //           color: Colors.black,
          //           fontSize: 15,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
            height: 200,
            width: 400,
            // decoration: BoxDecoration(
            //   // color: Color.fromARGB(255, 230, 230, 230),
            //   borderRadius: BorderRadius.circular(10),
            // //),
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
            margin: EdgeInsets.fromLTRB(20, 300, 20, 0),
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
                  onPressed: () {},
                ),
              ],
            ),
          )
          // Container(
          //   margin: EdgeInsets.fromLTRB(20, 80, 20, 0),
          //   child: ListView(
          //     children: <Widget>[
          //       Text(
          //         'NIK',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Full Name',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Sub Divisi',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Date Visit',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Located',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       SizedBox(height: 15),
          //       TextField(
          // keyboardType: TextInputType.multiline,
          // decoration: InputDecoration(
          //   prefixIcon: Icon(Icons.search),
          //   labelText: 'Please Search Store ......',
          //   border: OutlineInputBorder(),
          // ),
          //       ),
          //       SizedBox(height: 10),
          //       SizedBox(height: 10),
          //       Text(
          //         'Description',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Target',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'STK Numbers',
          //         style: TextStyle(
          //           color: Colors.orange,
          //         ),
          //       ),
          //       TextField(),
          //       SizedBox(height: 10),
          //       Text(
          //         'Upload Foto',
          //         style: TextStyle(
          //           color: Colors.black,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
