import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      routes: {
        "/": (context) => SignUpScreen(),
        "/welcome": (context) => DashboardScreen(),
      },
    );
    // #enddocregion build
  }
}
// #enddocregion MyApp

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

// #docregion _buildColumns
Widget _buildColumns() {
  return //Container(
      //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),child:
      Center(
          child: Row(children: [
    Container(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
        color: Colors.amber,
        child: Column(children: [fillColumns("New Politician Activity")])),
    Container(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
        color: Colors.amber,
        child: Column(children: [fillColumns("New Issues")])),
    Container(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
        color: Colors.amber,
        child: Column(children: [fillColumns("Followed Page Activity")]))
  ])); //);
}
// #enddocregion _buildColumns

// #docregion RWS-build
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.donut_large_sharp),
          title: Text('Dashboard'),
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
          backgroundColor: Colors.purple),
      body: _buildColumns(),
    );
  }
// #enddocregion RWS-build
}

void _buttonPress() {}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.donut_large_sharp),
          title: Text('Sign Up'),
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
          backgroundColor: Colors.purple),
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
