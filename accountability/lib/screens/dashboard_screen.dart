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
                Container(
                    width: 300,
                    color: Colors.grey,
                    child: Column(
                        children: [fillColumns("New Politician Activity")])),
                Container(
                    width: 300,
                    color: Colors.grey,
                    child: Column(children: [fillColumns("New Issues")])),
                Container(
                    width: 300,
                    color: Colors.grey,
                    child: Column(
                        children: [fillColumns("Followed Page Activity")]))
              ]))));
}

Widget fillColumns(String pageTitle) {
  return Column(children: [Text(pageTitle), Text("Hello")]);
}
