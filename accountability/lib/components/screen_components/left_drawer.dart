import 'package:accountability/routes.dart';
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
            child: Text(('My Profile')),
            onPressed: () {
              Navigator.pushNamed(
                context,
                ProfileScreenRoute,
              );
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: TextButton(
            child: Text(('My Organizations')),
            onPressed: () {
              Navigator.pushNamed(
                context,
                MyOrganizationsScreenRoute,
              );
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.emoji_people),
          title: TextButton(
            child: Text(('My Politicians')),
            onPressed: () {
              Navigator.pushNamed(
                context,
                MyPoliticiansScreenRoute,
              );
            },
          ),
        ),
      ],
    ),
  );
}
