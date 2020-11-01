import 'package:flutter/material.dart';
import 'package:accountability/components/app_bar.dart';
import 'package:accountability/components/left_drawer.dart';

class BrowsePoliticiansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Browse Politicians", context, _drawerKey),
      body: _buildBody(),
      drawer: buildDrawers(context),
    );
  }
}

Widget _buildBody() {
  return Center(
      child: Card(
          child: ListView(children: [
    ListTile(title: Text("Issue #1")),
    ListTile(title: Text("Issue #2")),
    ListTile(title: Text("Issue #3"))
  ])));
}
