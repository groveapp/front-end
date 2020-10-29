import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'This is The App Name',
        routes: {
          "/": (context) => SignUpScreen(),
          "/welcome": (context) => DashboardScreen(),
        },
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
          accentColor: Colors.cyan[600],
          fontFamily: 'Century Gothic',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Century Gothic'),
          ),
        ));
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Sign Up"),
      body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              child: Text("Press for Home Screen"))),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Dashboard"),
      body: _buildColumns(),
    );
  }
}

Widget buildAppBar(String title) {
  return AppBar(
    leading: Icon(Icons.donut_large_sharp),
    title: Text(title),
    actions: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text('Browse Politicians')),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text('Browse Issues')),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text('Trending')),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.search)),
      Icon(Icons.person)
    ],
  );
}

Widget _buildColumns() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      child: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
            width: 300,
            color: Colors.amber,
            child: Column(children: [fillColumns("New Politician Activity")])),
        Container(
            width: 300,
            color: Colors.amber,
            child: Column(children: [fillColumns("New Issues")])),
        Container(
            width: 300,
            color: Colors.amber,
            child: Column(children: [fillColumns("Followed Page Activity")]))
      ])));
}

Widget fillColumns(String title) {
  return Column(children: [
    Text(title),
    Text("add info here"),
    TextButton(
        onPressed: () {
          _buttonPress();
        },
        child: Text('Hello'))
  ]);
}

void _buttonPress() {}
