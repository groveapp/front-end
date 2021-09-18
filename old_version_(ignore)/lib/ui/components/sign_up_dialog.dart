import 'package:flutter/material.dart';

Widget signUpDialog() {
  return AlertDialog(
      title: Text("Sign Up"),
      contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      content: SignUpFields());
}

class SignUpFields extends StatefulWidget {
  @override
  _SignUpFieldsState createState() => _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: firstNameController,
          decoration: InputDecoration(
            labelText: 'First Name',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
        TextFormField(
          controller: lastNameController,
          decoration: InputDecoration(
            labelText: 'Last Name',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
        TextFormField(
          controller: emailController,
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
          controller: passwordController,
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
            child: ElevatedButton(
                onPressed: () {
                  //signUp(emailController.text, passwordController.text);
                },
                child: Text("Sign Up")))
      ],
    );
  }
}
