import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grove_front/router.dart';
import 'package:beamer/beamer.dart';
import 'package:grove_front/ui/shared/chart_test.dart';
import 'package:grove_front/ui/shared/charts.dart';
import 'package:grove_front/core/models/data_models/viewpoint.dart';

void main() => runApp(MyApp());

// define theme here, but we don't actually need it because styles are declared as classes

final groveTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFAFAFA),
    accentColor: const Color(0xAA424242),
    shadowColor: const Color(0xFF000000),
    cardColor: const Color(0xFFFFFFFF),
    buttonColor: const Color(0xFF2D7FE8),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 64.0,
          color: const Color(0xFF363636),
          fontWeight: FontWeight.w600),
      headline2: TextStyle(
          fontSize: 36.0,
          color: const Color(0xFF363636),
          fontWeight: FontWeight.w400),
      headline3: TextStyle(
          fontSize: 36.0,
          color: const Color(0xFF363636),
          fontWeight: FontWeight.w600),
      headline4: TextStyle(
          fontSize: 24.0,
          color: const Color(0xFF363636),
          fontWeight: FontWeight.w600),
      bodyText1: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFF363636),
          fontWeight: FontWeight.w400,
          fontFamily: 'Open Sans'),
      bodyText2: TextStyle(
          fontSize: 18.0,
          color: const Color(0xFF363636),
          fontWeight: FontWeight.w700,
          fontFamily: 'Open Sans'),
      overline: TextStyle(
          fontSize: 24.0,
          color: const Color(0xFF363636),
          fontWeight: FontWeight.w400),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      minWidth: 100,
      height: 36,
    ),
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.white)),
    cardTheme: CardTheme(
        clipBehavior: Clip.hardEdge, elevation: 4, margin: EdgeInsets.all(8)));

//init app

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     home: ViewpointApprovalChart(viewpointList: [
    //   Viewpoint(id: 1, issueId: 5, text: "I want more money", upvotes: 5),
    //   Viewpoint(id: 1, issueId: 5, text: "I want more money", upvotes: 3),
    //   Viewpoint(id: 2, issueId: 3, text: "I want less money", upvotes: 4),
    //   Viewpoint(id: 2, issueId: 5, text: "Hello", upvotes: 4)
    // ]));

    return MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: beamerDelegate,
        title: 'Grove',
        theme: groveTheme);
  }
}

// Steps to Structure App
// 0. Backend
//   determine what type of info to store, constant across all clients
//   determine relationships between info in DB model
//   generate SQL code from DB model, turn into DB
//   use sequelize to auto-create MVC backend
//   add needed routes and controllers for them
//   define auth scheme

// 1. Core
//   define data models from backend
//      once all backend routes are done, add test data to db, then stick test queries into JSON to Dart generator to create data models
//      stick them all into their own files
//      write needed api queries for each of them
//      write services to handle http errors + web routing
//      define authorized pages for a certain auth level

// 2. UI
//   define main views in "views" folder
//   add them to routes
//   define main theme in theme
//   define other shared components (button styles, card styles, list styles, etc. in shared folder)
//   define subsequent UI trees for each view, using shared components
//   for all components that have state, use provider for state management:
//     define providers models for that component's state
//     set consumers for it
//   define screen wrapper to wrap each view in a header and footer and get device size
