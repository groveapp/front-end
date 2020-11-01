import 'package:accountability/routing_constants.dart';
import 'package:flutter/material.dart';

Widget buildDrawers(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.purple,
          ),
          child: Text('Name of Project',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              )),
        ),
        ListTile(
            leading: Icon(Icons.home_outlined),
            title: TextButton(
              child: Text('Home'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HomeScreenRoute,
                );
              },
            )),
        ListTile(
          leading: Icon(Icons.speed),
          title: TextButton(
            child: Text('Dashboard'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                DashboardScreenRoute,
              );
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: TextButton(
            child: Text(('Profile')),
            onPressed: () {
              Navigator.pushNamed(
                context,
                ProfileScreenRoute,
              );
            },
          ),
        ),
      ],
    ),
  );
}
