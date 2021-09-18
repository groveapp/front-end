import 'package:flutter/material.dart';
import 'package:accountability/ui/components/add_viewpoint_dialog.dart';

class AddViewpointButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text("Add a Viewpoint"),
        onPressed: () {
          showDialog<void>(
              context: context, builder: (context) => addViewpointDialog());
        });
  }
}
