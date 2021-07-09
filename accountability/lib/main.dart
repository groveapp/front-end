import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:accountability/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'This is The App Name',
        onGenerateRoute: generateRoute,
        initialRoute: HomeScreenRoute,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xFF424242),
          accentColor: const Color(0xAA424242),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          fontFamily: 'Roboto',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 36.0),
            bodyText1: TextStyle(fontSize: 14.0),
            bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
        ));
  }
}

//ADD SCALE INSTEAD OF AGREE/DISAGREE

/*
purple: #a6a6ff
teal: 02EEE6, 52B6C, 216060
blue: 4D82AF
*/

//Current questions: 1) Add data on the search result cards?
//Scrollable appbar or no?
//Drawer or tabs?
//combatting viewpoints based on fake news?

//available domain names: mycorrhize, ideaflux, pinebark, treegrove,
