import 'package:accountability/routes.dart';
import 'package:flutter/material.dart';
import '../sign_in_dialog.dart';
import '../sign_up_dialog.dart';
import 'search_bar.dart';

Widget buildAppBar(String title, BuildContext context, _drawerKey) {
  final AlertDialog dialogSignUp = signUpDialog();
  final AlertDialog dialogSignIn = signInDialog();
  return AppBar(
    leading: InkWell(
        onTap: () {
          _drawerKey.currentState.openDrawer();
        },
        onHover: (value) {
          if (value = true) {
            _drawerKey.currentState.openDrawer();
          } else {
            _drawerKey.currentState.closeDrawer();
          }
        },
        child: Icon(Icons.donut_large_sharp)),
    title: Text(title),
    actions: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Theme(
              data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BrowsePoliticiansScreenRoute);
                  },
                  style: ButtonStyle(enableFeedback: false),
                  child: Text('Browse Politicians')))),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, IssueScreenRoute);
              },
              child: Text('Browse Issues'))),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DashboardScreenRoute,
                );
              },
              child: Text('Trending'))),
      SizedBox(width: 200, height: 40, child: SearchBar()),
      ButtonBar(children: [
        ElevatedButton(
            onPressed: () {
              showDialog<void>(
                  context: context, builder: (context) => dialogSignIn);
            },
            child: Text("Sign In")),
        ElevatedButton(
            onPressed: () {
              showDialog<void>(
                  context: context, builder: (context) => dialogSignUp);
            },
            child: Text("Sign Up"))
      ])
    ],
  );
}
