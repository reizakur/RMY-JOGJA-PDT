import 'package:belajar_flutter_2/ramayana_barcode.dart';
import 'package:flutter/material.dart';
import 'ramayana_home.dart';

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
              prefixIcon: const Icon(Icons.search),
              // suffixText: 'Search'
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 17, 17),
          elevation: 7.20,
          toolbarHeight: 75,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.filter_1),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, size: 18),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Ramayana();
                }));
              })),
      body: Scrollbar(
        controller: _vertical,
        child: Scrollbar(
          controller: _horizontal,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('No SKU')),
                    DataColumn(label: Text('Kode Toko')),
                    DataColumn(label: Text('Kode Lokasi')),
                    DataColumn(label: Text('QUantity')),
                    DataColumn(label: Text('Tanggal')),
                  ],
                  rows: const [
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
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 255, 17, 17),
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ScanBarcode();
            }));
          }),
    );
  }
}
