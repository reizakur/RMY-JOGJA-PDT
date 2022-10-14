import 'dart:convert';
import 'package:belajar_flutter_2/ramayana_barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './models/models_act.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'ramayana_home.dart';
import 'package:url_launcher/url_launcher.dart';

class ListAct extends StatefulWidget {
  const ListAct({super.key});

  @override
  State<ListAct> createState() => _ListActState();
}

class _ListActState extends State<ListAct> {
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            isCollapsed: true,
            labelText: 'Search',
            prefixIcon: Icon(Icons.search),
            // suffixText: 'Search'
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20,
        toolbarHeight: 75,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_1),
            onPressed: () {},
          ),
        ],
          leading: IconButton(
              icon: const Icon(Icons.arrow_back,
                  size: 18),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return Ramayana();
                        } ));
              }
          )
      ),

      body:
      Scrollbar(
        controller: _vertical,
        child: Scrollbar(
          controller: _horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:
              DataTable(
                columns: [
                  DataColumn(label: Text('No SKU')),
                  DataColumn(label: Text('Kode Toko')),
                  DataColumn(label: Text('Kode Lokasi')),
                  DataColumn(label: Text('QUantity')),
                  DataColumn(label: Text('Tanggal')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0008923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('1238923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('1118923455')),
                    DataCell(Text('RB17')),
                    DataCell(Text('0982434')),
                    DataCell(Text('1000')),
                    DataCell(Text('13 September')),
                  ]),
                ],
              ),
            )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 255, 17, 17),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) {
                      return ScanBarcode();
                    }));
          }
      ),
    );
  }
}