import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'This is The App Name',
        routes: {
          "/": (context) => SignUpScreen(),
          "/welcome": (context) => DashboardScreen(),
          "/profile": (context) => ProfileScreen(),
        },
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple,
          accentColor: Colors.cyan[600],
          fontFamily: 'Century Gothic',
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Century Gothic'),
          ),
        ));
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Sign Up", context),
      drawer: buildDrawers(),
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
      appBar: buildAppBar("Dashboard", context),
      body: _buildColumns(),
      drawer: buildDrawers(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("Dashboard", context),
        drawer: buildDrawers(),
        body: Center(child: Text("Hello")));
  }
}

Widget buildAppBar(String title, BuildContext context) {
  final AlertDialog dialog = signUpDialog();
  return AppBar(
    leading: InkWell(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Icon(Icons.donut_large_sharp)),
    title: Text(title),
    actions: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              child: Text('Browse Politicians'))),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              child: Text('Browse Issues'))),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              child: Text('Trending'))),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.search)),
      IconButton(
          onPressed: () {
            showDialog<void>(context: context, builder: (context) => dialog);
          },
          icon: Icon(Icons.person))
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
            color: Colors.grey,
            child: Column(children: [fillColumns("New Politician Activity")])),
        Container(
            width: 300,
            color: Colors.grey,
            child: Column(children: [fillColumns("New Issues")])),
        Container(
            width: 300,
            color: Colors.grey,
            child: Column(children: [fillColumns("Followed Page Activity")]))
      ])));
}

Widget fillColumns(String pageTitle) {
  return Column(children: [Text(pageTitle), Text("Hello")]);
}

Widget buildDrawers() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.purple,
          ),
          child: Text(
            'Name of Project',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.satellite),
          title: Text('Dashboard'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ),
  );
}

Widget signUpDialog() {
  return AlertDialog(
    title: Text("Sign Up"),
    contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
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
          decoration: InputDecoration(
            labelText: 'Address',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
      ],
    ),
  );
}
