import 'package:flutter/material.dart';
import 'package:accountability/components/app_bar.dart';
import 'package:accountability/components/left_drawer.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class IssueScreen extends StatefulWidget {
  @override
  State createState() => new _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  final ScrollController controller;

  _IssueScreenState({this.controller});

  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Issue Page", context, _drawerKey),
      body: //LayoutBuilder(builder: (context, constraints) {if (constraints.maxWidth > 600) {
          //return _buildThinContainers();
          // } else {
          //   return _buildNormalContainer();
          // }},
          //  child: _buildIssueBody(controller)),
          _buildIssueBody(controller),
      drawer: buildDrawers(context),
    );
  }
}

Widget _buildIssueBody(controller) {
  return Container(
      child: DraggableScrollbar.arrows(
          controller: controller,
          child: ListView(children: [
            Column(children: [
              _buildIssueHeader(),
              _buildViewPointList(),
              _buildIssueBottom()
            ])
          ])));
}

Widget _buildIssueHeader() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(children: [
            Column(children: [Text("Issue Name"), Text("Organization")]),
            Column(children: [
              Text("Page Metrics"),
              Text("Views"),
              Text("[insert] Viewpoints, [insert] Replies"),
              Text("[insert] Related Bills")
            ]),
            Column(children: [
              ElevatedButton(child: Text("Follow Page"), onPressed: () {}),
              ElevatedButton(child: Text("Share"), onPressed: () {})
            ])
          ])));
}

Widget _buildViewPointList() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              _buildViewpointCard(
                  "viewpointName", "viewpointTextSummary", "viewpointTextLong"),
              _buildViewpointCard(
                  "viewpointName", "viewpointTextSummary", "viewpointTextLong"),
              _buildViewpointCard(
                  "viewpointName", "viewpointTextSummary", "viewpointTextLong"),
              Card(
                  child: Column(children: [
                Text("More Viewpoints", style: TextStyle(fontSize: 16)),
                Card(child: Text("Viewpoint 4 Lorem Ipsum Dolor Sit Amet")),
                Card(child: Text("Viewpoint 4 Lorem Ipsum Dolor Sit Amet")),
                Card(child: Text("Viewpoint 4 Lorem Ipsum Dolor Sit Amet")),
                TextButton(child: Text("View More"), onPressed: () {})
              ]))
            ],
          )));
}

Widget _buildViewpointCard(String viewpointName, String viewpointTextSummary,
    String viewpointTextLong) {
  return Card(
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
          child: SelectableText("Supporting Organizations"), onPressed: () {}),
      TextButton(child: SelectableText("Supporting Leaders"), onPressed: () {})
    ]),
    ButtonBar(children: [
      ElevatedButton(child: Text("Agree"), onPressed: () {}),
      ElevatedButton(child: Text("Disagree"), onPressed: () {}),
      Slider(value: 5, min: 0, max: 10, onChanged: (value) {})
    ])
  ]));
}

Widget _buildIssueBottom() {
  return Row(
      children: [_buildDataTable(), _relatedBillsList(), _similarIssues()]);
}

Widget _buildDataTable() {
  return DataTable(columns: const <DataColumn>[
    DataColumn(label: Text('Your Politicians', style: TextStyle(fontSize: 18))),
    DataColumn(label: Text('Bill or Measure', style: TextStyle(fontSize: 14))),
    DataColumn(
        label: Text('Consitutency Opinion', style: TextStyle(fontSize: 14))),
    DataColumn(label: Text('Divergence Index', style: TextStyle(fontSize: 14)))
  ], rows: <DataRow>[
    DataRow(cells: <DataCell>[
      DataCell(Text("Congressman Green")),
      DataCell(Text("Revising the Education System")),
      DataCell(Text("53% in favor")),
      DataCell(Text("2.57"))
    ]),
    DataRow(cells: <DataCell>[
      DataCell(Text("Congressman Green")),
      DataCell(Text("Revising the Education System")),
      DataCell(Text("53% in favor")),
      DataCell(Text("2.57"))
    ]),
    DataRow(cells: <DataCell>[
      DataCell(Text("Congressman Green")),
      DataCell(Text("Revising the Education System")),
      DataCell(Text("53% in favor")),
      DataCell(Text("2.57"))
    ]),
    DataRow(cells: <DataCell>[
      DataCell(Text("Congressman Green")),
      DataCell(Text("Revising the Education System")),
      DataCell(Text("53% in favor")),
      DataCell(Text("2.57"))
    ]),
  ]);
}

Widget _relatedBillsList() {
  return Column(
    children: [
      Text("Related Bills and Measures"),
      Column(children: [
        Text("Local"),
        Text("Measure ABCD"),
        Text("Measure ABCD")
      ]),
      Column(children: [
        Text("State"),
        Text("Measure ABCD"),
        Text("Measure ABCD")
      ]),
      Column(children: [
        Text("National"),
        Text("Measure ABCD"),
        Text("Measure ABCD")
      ]),
      TextButton(child: Text("View More"), onPressed: () {})
    ],
  );
}

Widget _similarIssues() {
  return Column(children: [
    Text("Similar Issues"),
    Column(
      children: [Text("Issue #1"), Text("Issue #2"), Text("Issue #3")],
    )
  ]);
}
