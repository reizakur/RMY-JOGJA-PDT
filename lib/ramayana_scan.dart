import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Void extends StatelessWidget {
  const Void({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Void'),
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
                    'Form Void', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23, color: Colors.black),
                    ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 80, 30, 0),
                child: ListView(
                  children: <Widget>[
                     Text('Code',
                  style: TextStyle(color: Color.fromARGB(255, 255, 17, 17), fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  TextField(),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 17, 17),
                margin: EdgeInsets.only(top:170),
                height: 50,
                child: Container(
                 margin: EdgeInsets.only(right: 7),
                    width: 500,
                    child: 
                    TextButton(
                      onPressed: () {}, 
                      child: 
                       Text(
                      'GENERATE', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
                       ),
                      ),
                  
                  
              )
              ),
              Container(
                color: Color.fromARGB(255, 239, 237, 237),
                width: 500,
                height: 50,
                    margin: EdgeInsets.fromLTRB(10, 250,10, 0),
              child:
              Container(
                child: 
                TextButton(
                      onPressed: () {}, 
                      child: 
                       Text(
                      'Scan Barcode', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: Colors.black),
                       ),
                      ),
              ),
              ),
              Container(
                 margin: EdgeInsets.fromLTRB(30, 340,30, 0),
                child: ListView(
                  children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 65),
                    child: QrImage(
                      data: "Syauqi Void",
                      version: QrVersions.auto,
                      size: 200.0,
                        ),
                  ),
                 
                  ],
                ),
              )
        ]
        ),
    );
  }
}