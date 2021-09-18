import 'package:flutter/material.dart';

class MyFormField extends StatefulWidget {
  MyFormField({Key key}) : super(key: key);

  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyFormFieldState extends State<MyFormField> {
  String dropdownValue = 'Overall';

  @override
  Widget build(BuildContext context) {
    var categories = [
      "Overall",
      "Party",
      "Income",
      "Race",
      "Gender",
      "Religion",
      "Education Level",
      "Location",
      "Age"
    ];

    return Theme(
        data: ThemeData(hoverColor: Colors.grey),
        child: DropdownButtonFormField(
            hint: Text("Choose a factor..."),
            focusColor: Colors.grey,
            items: categories.map((String category) {
              return new DropdownMenuItem(
                  value: category,
                  child: Row(
                    children: <Widget>[
                      Text(category),
                    ],
                  ));
            }).toList(),
            onChanged: (newValue) {
              // do other stuff with _category
              setState(() => dropdownValue = newValue);
            },
            value: dropdownValue,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                filled: true,
                fillColor: Colors.grey[200],
                hoverColor: Colors.grey)));
  }
}
