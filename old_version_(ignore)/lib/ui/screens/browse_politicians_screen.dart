import 'package:flutter/material.dart';
import 'package:accountability/ui/web_app/web_screen_builder.dart';

class BrowsePoliticiansScreenBody extends StatelessWidget {
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
