import 'package:flutter/material.dart';

Widget buildViewpointCard(issueKey) {
  //get data from backend
  return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(children: [
        Row(
          children: [
            SelectableText(/*issueKey.name*/ issueKey),
            IconButton(icon: Icon(Icons.flag_rounded), onPressed: () {})
          ],
        ),
        FittedBox(
          child: SelectableText(/*issueKey.summary*/ "add summary here"),
        ),
        TextButton(
            child: Text("Expand Viewpoint and Show Replies"), onPressed: () {}),
        Column(children: [
          SelectableText("# Agrees:"),
          SelectableText("# Disagrees:")
        ]),
        Column(children: [
          TextButton(
              child: SelectableText("Supporting Organizations"),
              onPressed: () {}),
          TextButton(
              child: SelectableText("Supporting Leaders"), onPressed: () {})
        ]),
        ButtonBar(children: [
          ElevatedButton(child: Text("Agree"), onPressed: () {}),
          ElevatedButton(child: Text("Disagree"), onPressed: () {}),
        ]),
        ButtonBar(children: [
          Slider(value: 5, min: 0, max: 10, onChanged: (value) {})
        ])
      ]));
}

/*
Widget _buildViewpointCard(String viewpointName, String viewpointTextSummary,
    String viewpointTextLong) {
  return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(children: [
        Row(
          children: [
            SelectableText(viewpointName),
            IconButton(icon: Icon(Icons.flag), onPressed: () {})
          ],
        ),
        FittedBox(
          child: SelectableText(viewpointTextSummary),
        ),
        TextButton(
            child: Text("Expand Viewpoint and Show Replies"), onPressed: () {}),
        Column(children: [
          SelectableText("# Agrees:"),
          SelectableText("# Disagrees:")
        ]),
        Column(children: [
          TextButton(
              child: SelectableText("Supporting Organizations"),
              onPressed: () {}),
          TextButton(
              child: SelectableText("Supporting Leaders"), onPressed: () {})
        ]),
        ButtonBar(children: [
          ElevatedButton(child: Text("Agree"), onPressed: () {}),
          ElevatedButton(child: Text("Disagree"), onPressed: () {}),
        ]),
        ButtonBar(children: [
          Slider(value: 5, min: 0, max: 10, onChanged: (value) {})
        ])
      ]));
}
*/
