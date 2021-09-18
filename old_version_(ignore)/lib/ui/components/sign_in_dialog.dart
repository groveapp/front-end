import 'package:flutter/material.dart';

Widget signInDialog() {
  return AlertDialog(
      title: Text("Sign In"),
      contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      content: SignInFields());
}

class SignInFields extends StatefulWidget {
  @override
  _SignInFieldsState createState() => _SignInFieldsState();
}

class _SignInFieldsState extends State<SignInFields> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                  //signIn(emailController.text, passwordController.text);
                },
                child: Text("Sign In")))
        //forgot password
        //already signed in?
      ],
    );
  }
}
