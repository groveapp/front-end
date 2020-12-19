import 'package:flutter/material.dart';
import 'package:accountability/ui/web_app/web_screen_builder.dart';

class ErrorScreenBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Center(
        child: Column(children: [
      Text("Sorry, we couldn't find that page!",
          style: TextStyle(fontSize: 30)),
      Text("Check your URL, or try going back a page.",
          style: TextStyle(fontSize: 20))
    ]));
  }
}
