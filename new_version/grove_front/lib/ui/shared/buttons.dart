import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

class PrimaryTextButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  PrimaryTextButton({required this.child, required this.onPressed});
  Widget build(BuildContext context) {
    return TextButton(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: child),
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: actionColor,
            minimumSize: Size(100, 30),
            enableFeedback: false));
  }
}

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  PrimaryButton({required this.text, required this.onPressed});

  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(text,
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.w800))),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: actionColor,
            onPrimary: actionColor,
            minimumSize: Size(75, 30),
            enableFeedback: false));
  }
}

class AltButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  AltButton({required this.text, required this.onPressed});

  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(text,
                style: TextStyle(
                    color: actionColor, fontFamily: altFont, fontSize: 12))),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: offPrimaryColor,
            onPrimary: offPrimaryColor,
            minimumSize: Size(75, 30),
            enableFeedback: false));
  }
}

class NavButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  NavButton({required this.text, required this.onPressed});
  Widget build(BuildContext context) {
    return TextButton(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: NavPlain(
              text: text,
            )),
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: fontColor,
            minimumSize: Size(100, 30),
            enableFeedback: false));
  }
}
