import 'package:flutter/material.dart';
import 'package:accountability/ui/components/add_issue_dialog.dart';

class AddIssueButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text("Add an Issue"),
        onPressed: () {
          showDialog<void>(
              context: context, builder: (context) => addIssueDialog());
        });
  }
}
