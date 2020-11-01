import 'package:flutter/material.dart';

Widget signInDialog() {
  return AlertDialog(
    title: Text("Sign In"),
    contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email or Username',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ElevatedButton(onPressed: () {}, child: Text("Sign In")))
      ],
    ),
  );
}
