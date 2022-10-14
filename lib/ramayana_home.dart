import 'package:belajar_flutter_2/form_pdt.dart';
import 'package:belajar_flutter_2/list_pdt.dart';
import 'package:belajar_flutter_2/ramayana_%20form.dart';
import 'package:belajar_flutter_2/ramayana_barcode.dart';
import 'package:belajar_flutter_2/ramayana_list_file.dart';
import 'package:belajar_flutter_2/ramayana_profile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:relative_scale/relative_scale.dart';


class Ramayana extends StatefulWidget {
  const Ramayana({Key? key}) : super(key: key);

  @override
  State<Ramayana> createState() => _RamayanaState();
}

class _RamayanaState extends State<Ramayana> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
        builder: (context, height, width, sy, sx) {
          return Scaffold(
              appBar: AppBar(
                  title: Text('Dashboard',
                    style: TextStyle(
                      fontSize: sy(14),
                    ),),
                  backgroundColor: Color.fromARGB(250, 236, 7, 7),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return Profilee();
                                  }));
                        }
                    ),
                    IconButton(
                        icon: const Icon(Icons.power_settings_new),
                        onPressed: () {}
                    )
                  ],

                  elevation: 20,
                  leading: IconButton(
                      icon: const Icon(Icons.home,
                          size: 18),
                      onPressed: () {}
                  )
              ),

              body:
              Stack(
                fit: StackFit.loose,
                children: [
                  ListView(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/ramayana.png',
                              height: sy(150),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(top: sy(75), left: sy(20), right: sy(20)),
                        height: sy(200),
                        width: sy(400),
                        decoration:
                        BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  3.0,
                                  3.0,
                                ),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              ), //BoxShadow
                            ]
                        ),
                      ),

                      AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        // maintainAnimation: true,
                        // maintainState: true,
                        // maintainSize: true,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Column(
                              //   children: <Widget>[
                              //     IconButton(
                              //       icon: Icon(Icons.add_circle,
                              //           color: Colors.white),
                              //       onPressed: () {
                              //         Navigator.push(context,
                              //             MaterialPageRoute(
                              //                 builder: (context) {
                              //                   return Activity();
                              //                 }));
                              //       },
                              //     ),
                              //
                              //     Text('ADD ACT',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: sy(10),
                              //       ),)
                              //   ],
                              // ),

                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.list_alt,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) {
                                                return ListActivityPage();
                                              }));
                                    },
                                  ),

                                  Text('LIST ACT',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: sy(10),
                                    ),)
                                ],
                              ),

                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.add_circle,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) {
                                                return FormAct();
                                              }));
                                    },
                                  ),

                                  Text('ADD',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: sy(10),
                                    ),)
                                ],
                              ),

                            ],
                          ),
                          margin: EdgeInsets.only(top: sy(30), left: sy(70), right: sy(70)),
                          height: sy(50),
                          // width: sy(100),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.menu,
                                    color: Colors.white
                                ),
                                onPressed: () {
                                  setState(() {
                                    _visible = !_visible;
                                  });
                                },
                              )
                            ],
                          ),
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.width / 6,
                          margin: EdgeInsets.only(top: sy(10), left: sy(100), right: sy(100)),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 0, 0),
                            borderRadius: BorderRadius.circular(sy(50)),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: sy(50),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(250, 255, 0, 0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '     Welcome to ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: sy(10),
                          ),
                        ),
                        Text(
                          'PDT RB17 ',
                          style: TextStyle(
                              fontSize: sy(10),
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                          ),
                        ),
                        Text(
                          'in My Activity ',
                          style: TextStyle(
                            fontSize: sy(10),
                          ),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(top: sy(33), left: sy(20), right: sy(20)),
                    height: sy(30),
                    width: sy(400),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(sy(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                        ]
                    ),
                  ),
                ],
              ),

          );
        }
    );
  }
}
