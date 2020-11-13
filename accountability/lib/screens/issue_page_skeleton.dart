import 'package:accountability/components/app_bar.dart';
import 'package:accountability/components/left_drawer.dart';
import 'package:flutter/material.dart';
import 'screen_template.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class IssueCard extends StatefulWidget {
  @override
  State createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Issue Page", context, _drawerKey),
      body: Center(
        child: Transform(
            transform: Matrix4.identity()..scale(1),
            child: buildIssue(screenWidth, screenHeight, sampleIssue)),
      ),
      drawer: buildDrawers(context),
    );
  }
}

Widget buildIssue(screenWidth, screenHeight, issue) {
  int numResponses = issue.numResponses;
  int numExpertResponses = issue.numExpertResponses;
  int popularityRank = issue.popularityRank;
  return SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Center(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  // child:
                  // SizedBox(
                  //   height: 600,
                  //   width: 1000,
                  child: SingleChildScrollView(
                    child: Card(
                        child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 16),
                                          child: SelectableText(issue.title,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 48,
                                                  color: Colors.black)),
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16, horizontal: 16),
                                            child: SelectableText(issue.summary,
                                                minLines: 1,
                                                maxLines: 7,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey))),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 16),
                                            child: TextButton(
                                                child: Text(
                                                    "View Expert Briefings"),
                                                onPressed: () {})),
                                      ]),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SelectableText(
                                            "$numResponses Responses",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey)),
                                        SelectableText(
                                            "$numExpertResponses Expert Responses",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey)),
                                        SelectableText(
                                            "#$popularityRank Most Popular",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey))
                                      ])),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  child: Column(children: [
                                    Container(
                                      padding: EdgeInsets.all(4),
                                      child: ElevatedButton(
                                          child: Text("Follow Issue"),
                                          onPressed: () {}),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        child: ElevatedButton(
                                            child: Text("Share"),
                                            onPressed: () {}))
                                  ]))
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildPieChart(),
                              _buildViewpointList(screenWidth, screenHeight)
                            ]),
                        Row(children: [
                          _buildDataTable(),
                          _relatedBillsList(),
                          _similarIssues()
                        ])
                      ],
                    )),
                  ))))
      // )
      ;
}

Widget _buildPieChart() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SizedBox(
          height: 300,
          width: 300,
          child: charts.PieChart(series, animate: true)));
}

var series = [
  charts.Series(
    domainFn: (ViewpointData viewpointData, _) => viewpointData.title,
    measureFn: (ViewpointData viewpointData, _) => viewpointData.numAgrees,
    id: '# Agrees',
    data: sampleChartData,
  ),
];

Widget _buildViewpointList(screenWidth, screenHeight) {
  //ScrollController _controller;
  // @override
  // void initState() {
  //   _controller = ScrollController();
  //   super.initState();
  // }

  //final itemSize = 100.0;

  // _moveLeft() {
  //   _controller.animateTo(_controller.offset - itemSize,
  //       curve: Curves.linear, duration: Duration(milliseconds: 500));
  // }

  // _moveRight() {
  //   _controller.animateTo(_controller.offset + itemSize,
  //       curve: Curves.linear, duration: Duration(milliseconds: 500));
  // }

  return Row(children: [
    IconButton(
        icon: Icon(Icons.arrow_back_sharp),
        onPressed: //_moveLeft(),
            () {}),
    Container(
        width: 800,
        height: 400,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        color: Colors.grey,
        // child: ListView.builder(
        //     itemCount: 3,
        //     //itemExtent: itemSize,
        //     //controller: _controller,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (sampleViewpoint, index) {
        //       return buildViewpoints(
        //           screenWidth, screenHeight, sampleViewpoint);
        //     })),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
            buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
            buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
            buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
          ],
        )),
    IconButton(
        icon: Icon(Icons.arrow_forward_sharp),
        onPressed: //_moveRight(),
            () {})
  ]);
}

Widget _buildDataTable() {
  return Transform(
      transform: Matrix4.identity()..scale(0.75),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: DataTable(columns: const <DataColumn>[
            DataColumn(
                label:
                    Text('Your Politicians', style: TextStyle(fontSize: 18))),
            DataColumn(
                label: Text('Bill or Measure', style: TextStyle(fontSize: 14))),
            DataColumn(
                label: Text('Consitutency Opinion',
                    style: TextStyle(fontSize: 14))),
            DataColumn(
                label: Text('Divergence Index', style: TextStyle(fontSize: 14)))
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
          ])));
}

Widget _relatedBillsList() {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      "Related Measures",
      style: TextStyle(fontSize: 20),
      textAlign: TextAlign.left,
    ),
    Container(
        height: 500,
        width: 200,
        child: ListView(
          children: [
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            TextButton(child: Text("View More"), onPressed: () {})
          ],
        ))
  ]);
}

Widget _similarIssues() {
  return Column(children: [
    Text("Similar Issues", style: TextStyle(fontSize: 20)),
    Container(
        height: 500,
        width: 200,
        child: ListView(
          children: [
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            ListTile(title: Text("Measure ABCD"), subtitle: Text("Tulsa")),
            TextButton(child: Text("View More"), onPressed: () {})
          ],
        ))
  ]);
}

class IssueData {
  String title;
  String summary;
  int numResponses;
  int numExpertResponses;
  int popularityRank;

  IssueData(this.title, this.summary, this.numResponses,
      this.numExpertResponses, this.popularityRank);
}

var sampleIssue =
    IssueData("Issue Title", "This is an issue summary.", 54, 79, 5);

class ViewpointData {
  String title;
  String summary;
  int numAgrees;
  int numDisagrees;
  int popularityRank;

  ViewpointData(this.title, this.summary, this.numAgrees, this.numDisagrees,
      this.popularityRank);
}

var sampleViewpoint = ViewpointData(
    "Viewpoint Title 1", "This is a viewpoint summary.", 54, 79, 5);

var sampleViewpoint2 = ViewpointData(
    "Viewpoint Title 2", "This is a viewpoint summary.", 66, 89, 5);

var sampleViewpoint3 = ViewpointData(
    "Viewpoint Title 3", "This is a viewpoint summary.", 24, 73, 5);

var sampleChartData = [sampleViewpoint, sampleViewpoint2, sampleViewpoint3];
