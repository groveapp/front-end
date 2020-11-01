import 'package:accountability/routing_constants.dart';
import 'package:flutter/material.dart';
import 'sign_in_dialog.dart';
import 'sign_up_dialog.dart';

Widget buildAppBar(String title, BuildContext context, _drawerKey) {
  final AlertDialog dialogSignUp = signUpDialog();
  final AlertDialog dialogSignIn = signInDialog();
  return AppBar(
    leading: IconButton(
        onPressed: () {
          _drawerKey.currentState.openDrawer();
        },
        icon: Icon(Icons.donut_large_sharp)),
    title: Text(title),
    actions: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, DashboardScreenRoute);
              },
              child: Text('Browse Politicians'))),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, DashboardScreenRoute);
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
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.search)),
      TextButton(
          onPressed: () {
            showDialog<void>(
                context: context, builder: (context) => dialogSignIn);
          },
          child: Text("Sign In")),
      TextButton(
          onPressed: () {
            showDialog<void>(
                context: context, builder: (context) => dialogSignUp);
          },
          child: Text("Sign Up"))
    ],
  );
}
