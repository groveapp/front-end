import 'package:flutter/material.dart';

Widget buildRelatedBillsList() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      "Related Measures",
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.left,
    ),
    Container(
        height: 500,
        width: 200,
        child: ListView(
          children: [
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            TextButton(child: Text("View More"), onPressed: () {})
          ],
        ))
  ]);
}
