import 'package:flutter/material.dart';
import 'package:accountability/components/screen_components/app_bar.dart';
import 'package:accountability/components/screen_components/left_drawer.dart';
import 'package:accountability/web_app/web_screen_builder.dart';

class BrowseIssuesScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}

Widget _buildBody() {
  return Center(
      child: Card(
          child: ListView(children: [
    ListTile(title: Text("Issue #1")),
    ListTile(title: Text("Issue #2")),
    ListTile(title: Text("Issue #3"))
  ])));
}
