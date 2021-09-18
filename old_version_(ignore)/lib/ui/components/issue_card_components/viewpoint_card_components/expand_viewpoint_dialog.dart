import 'package:flutter/material.dart';

Widget expandViewpointDialog(viewpoint) {
  return AlertDialog(
    title: Text(viewpoint.title),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
