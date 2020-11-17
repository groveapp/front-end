import 'package:flutter/material.dart';
import 'package:accountability/components/screen_components/app_bar.dart';
import 'package:accountability/components/screen_components/left_drawer.dart';

class DashboardScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Dashboard", context, _drawerKey),
      body: _buildBody(),
      drawer: buildDrawers(context),
    );
  }
}

Widget _buildBody() {
  return Center(
      child: Column(children: [
    Text("Sorry, we couldn't find that page!", style: TextStyle(fontSize: 30)),
    Text("Check your URL, or try going back a page.",
        style: TextStyle(fontSize: 20))
  ]));
}
