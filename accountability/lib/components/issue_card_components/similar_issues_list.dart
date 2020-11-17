import 'package:flutter/material.dart';

Widget buildSimilarIssuesList() {
  return Column(children: [
    Text("Similar Issues", style: TextStyle(fontSize: 20)),
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
