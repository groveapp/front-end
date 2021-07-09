import 'package:flutter/material.dart';
import 'colors.dart';

const altFont = 'Open Sans';
const primaryFont = 'Merriweather';

class Head1Bold extends StatelessWidget {
  final String text;
  Head1Bold({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 64,
            fontWeight: FontWeight.w600));
  }
}

class Head1Plain extends StatelessWidget {
  final String text;
  Head1Plain({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 64,
            fontWeight: FontWeight.w400));
  }
}

class Head2Bold extends StatelessWidget {
  final String text;
  Head2Bold({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 28,
            fontWeight: FontWeight.w600));
  }
}

class Head2Plain extends StatelessWidget {
  final String text;
  Head2Plain({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 28,
            fontWeight: FontWeight.w400));
  }
}

class Head2PlainWhite extends StatelessWidget {
  final String text;
  Head2PlainWhite({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w400));
  }
}

class Head3Bold extends StatelessWidget {
  final String text;
  Head3Bold({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w600));
  }
}

class Head3Plain extends StatelessWidget {
  final String text;
  Head3Plain({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w400));
  }
}

class Head4Article extends StatelessWidget {
  final String text;
  Head4Article({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text.toUpperCase(),
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w400));
  }
}

class BodyPlain extends StatelessWidget {
  final String text;
  BodyPlain({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: altFont,
            color: fontColor,
            fontSize: 14,
            fontWeight: FontWeight.w400));
  }
}

class BodyBold extends StatelessWidget {
  final String text;
  BodyBold({required this.text});
  Widget build(BuildContext context) {
    return SelectableText(text,
        style: TextStyle(
            fontFamily: altFont,
            color: fontColor,
            fontSize: 14,
            fontWeight: FontWeight.w700));
  }
}

class NavPlain extends StatelessWidget {
  final String text;
  NavPlain({required this.text});
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 20,
            fontWeight: FontWeight.w400));
  }
}

class NavLarge extends StatelessWidget {
  final String text;
  NavLarge({required this.text});
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: primaryFont,
            color: fontColor,
            fontSize: 28,
            fontWeight: FontWeight.w400));
  }
}
