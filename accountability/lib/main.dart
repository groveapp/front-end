import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'routes.dart';

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
          primaryColor: Colors.purple,
          accentColor: Colors.cyan[600],
          fontFamily: 'Roboto',
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
          ),
        ));
  }
}

//ADD SCALE INSTEAD OF AGREE/DISAGREE
//GUMBO
//Jambalaya
//Add Sign Up Links from organizations
