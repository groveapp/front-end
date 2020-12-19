import 'package:flutter/material.dart';

//export data

Widget buildDataTable() {
  return Transform(
      transform: Matrix4.identity()..scale(1),
      child: Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: DataTable(columns: const <DataColumn>[
                DataColumn(
                    label: Text('Your Politicians',
                        style: TextStyle(fontSize: 18))),
                DataColumn(
                    label: Text('Bill or Measure',
                        style: TextStyle(fontSize: 14))),
                DataColumn(
                    label: Text('Consitutency Opinion',
                        style: TextStyle(fontSize: 14))),
                DataColumn(
                    label: Text('Divergence Index',
                        style: TextStyle(fontSize: 14)))
              ], rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text("Congressman Green")),
                  DataCell(Text("Revising the Education System")),
                  DataCell(Text("53% in favor")),
                  DataCell(Text("2.57"))
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text("Congressman Green")),
                  DataCell(Text("Revising the Education System")),
                  DataCell(Text("53% in favor")),
                  DataCell(Text("2.57"))
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text("Congressman Green")),
                  DataCell(Text("Revising the Education System")),
                  DataCell(Text("53% in favor")),
                  DataCell(Text("2.57"))
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text("Congressman Green")),
                  DataCell(Text("Revising the Education System")),
                  DataCell(Text("53% in favor")),
                  DataCell(Text("2.57"))
                ]),
              ]))));
}
