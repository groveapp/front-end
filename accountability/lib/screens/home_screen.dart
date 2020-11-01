import 'package:flutter/material.dart';
import 'package:accountability/components/app_bar.dart';
import 'package:accountability/components/left_drawer.dart';
import 'package:accountability/components/sign_in_dialog.dart';
import 'package:accountability/components/sign_up_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    Key _drawerKey = GlobalKey();
    final AlertDialog dialogSignUp = signUpDialog();
    final AlertDialog dialogSignIn = signInDialog();
    return Scaffold(
        key: _drawerKey,
        appBar: buildAppBar("Home", context, _drawerKey),
        drawer: buildDrawers(context),
        body: Center(
            child: Container(
                child: Column(children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Welcome to [NAME]'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'A place where you can do x,y,z',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          showDialog<void>(
                              context: context,
                              builder: (context) => dialogSignIn);
                        },
                        child: Text("Sign In")),
                    TextButton(
                        onPressed: () {
                          showDialog<void>(
                              context: context,
                              builder: (context) => dialogSignUp);
                        },
                        child: Text("Sign Up")),
                  ],
                ),
              ],
            ),
          ),
          Card(
              child: Column(children: [
            ListTile(title: Text("Trending Issue #1")),
            ListTile(title: Text("Trending Issue #2")),
            ListTile(title: Text("Trending Issue #3"))
          ]))
        ]))));
  }
}
