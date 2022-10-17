import 'package:belajar_flutter_2/ramayana_home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
              ],
            ),
        title: 'Ramayana',
        debugShowCheckedModeBanner: false,
        home: const Ramayana());
  }
}

//tes push adel

//ini pembaruan dari adel 17 oketobr 2022 11:29

//ini perybahas dadas reza

