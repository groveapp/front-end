import 'package:accountability/routes.dart';
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
                Navigator.pushNamed(context, BrowsePoliticiansScreenRoute);
              },
              child: Text('Browse Politicians'))),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, IssuePageTemplateRoute);
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
      SizedBox(
        width: 400,
        height: 40,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Search issues and politicians',
            labelStyle: TextStyle(color: Colors.black),
            suffixIcon: IconButton(
              onPressed: () {
                _search("Add Value Here");
              },
              icon: Icon(Icons.search, color: Colors.black),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
          onFieldSubmitted: (value) {
            _search(value);
          },
        ),
      ),
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

Widget _search(String value) {
  return Text("Add Search Functionality Here");
}
