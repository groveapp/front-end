import 'package:flutter/material.dart';
import 'package:accountability/components/app_bar.dart';
import 'package:accountability/components/left_drawer.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State createState() => new _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    return Scaffold(
        key: _drawerKey,
        appBar: buildAppBar("Profile", context, _drawerKey),
        drawer: buildDrawers(context),
        body: Center(
            child: Text("Add demographics, address, organizations, etc.")));
  }
}
