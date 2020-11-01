import 'package:flutter/material.dart';
import 'package:accountability/components/app_bar.dart';
import 'package:accountability/components/left_drawer.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Dashboard", context, _drawerKey),
      body: _buildColumns(),
      drawer: buildDrawers(context),
    );
  }
}

Widget _buildColumns() {
  return SingleChildScrollView(
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                    width: 200,
                    child: Card(
                        color: Colors.grey,
                        child: Column(children: [
                          fillColumns("New Politician Activity")
                        ]))),
                SizedBox(
                    width: 200,
                    child: Card(
                        color: Colors.grey,
                        child: Column(children: [fillColumns("New Issues")]))),
                SizedBox(
                    width: 200,
                    child: Card(
                        color: Colors.grey,
                        child: Column(
                            children: [fillColumns("Followed Page Activity")])))
              ]),
              Column(
                children: [
                  Card(
                      color: Colors.grey,
                      child: Column(
                        children: [
                          Text("My Politicians"),
                          Text("Mr. Green"),
                          Text("Dr. Blue")
                        ],
                      )),
                  Card(
                      color: Colors.grey,
                      child: Column(children: [
                        Text("My Organizations"),
                        Text("Organization 1"),
                        Text("Organization 2")
                      ])),
                ],
              )
            ]))),
  );
}

Widget fillColumns(String pageTitle) {
  return Column(children: [Text(pageTitle), Text("Hello")]);
}
