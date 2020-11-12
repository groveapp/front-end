/*
routes
set appbar
get screen size constraints
if screen size is less than X pixels, then do horizontal layout
if not, then do vertical layout
vertical layout: 
  container
  center
  home screen
*/
import 'package:flutter/material.dart';
import 'package:accountability/components/app_bar.dart';
import 'package:accountability/components/left_drawer.dart';

class ViewpointCard extends StatefulWidget {
  @override
  State createState() => _ViewpointCardState();
}

class _ViewpointCardState extends State<ViewpointCard> {
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
            transform: Matrix4.identity()..scale(0.75),
            child:
                _buildViewpoints(screenWidth, screenHeight, sampleViewpoint)),
      ),
      drawer: buildDrawers(context),
    );
  }
}

Widget _buildViewpoints(screenWidth, screenHeight, viewpoint) {
  double _currentValue = 5;
  int numAgrees = viewpoint.numAgrees;
  int numDisagrees = viewpoint.numDisagrees;
  int popularityRank = viewpoint.popularityRank;
  return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: SizedBox(
                height: 400,
                width: 600,
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
                                  vertical: 16, horizontal: 16),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(viewpoint.title,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 36, color: Colors.black)),
                                  ]),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText("$numAgrees Agrees",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    SelectableText("$numDisagrees Disagrees",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    SelectableText(
                                        "#$popularityRank Most Popular",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey))
                                  ])),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Row(children: [
                                IconButton(
                                    icon: Icon(Icons.flag_rounded, size: 24),
                                    color: Colors.deepPurple,
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(Icons.message_rounded,
                                        size: 24, color: Colors.deepPurple),
                                    onPressed: () {})
                              ]))
                        ]),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: SelectableText(viewpoint.summary,
                                minLines: 1,
                                maxLines: 7,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)))),
                    TextButton(
                        child: Text("Expand Viewpoint and View Replies",
                            style: TextStyle(fontSize: 16)),
                        onPressed: () {}),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              child: Text("Supporting Organizations"),
                              onPressed: () {}),
                          TextButton(
                              child: Text("Supporting Experts"),
                              onPressed: () {}),
                          TextButton(
                              child: Text("Supporting Leaders"),
                              onPressed: () {})
                        ]),
                    ButtonBar(alignment: MainAxisAlignment.center, children: [
                      ElevatedButton(child: Text("Agree"), onPressed: () {}),
                      ElevatedButton(child: Text("Disagree"), onPressed: () {}),
                      Slider(
                          value: _currentValue,
                          min: 0,
                          max: 10,
                          onChanged: (double value) {})
                    ])
                  ],
                )),
              ))));
}

class ViewpointData {
  String title;
  String summary;
  int numAgrees;
  int numDisagrees;
  int popularityRank;

  ViewpointData(this.title, this.summary, this.numAgrees, this.numDisagrees,
      this.popularityRank);
}

var sampleViewpoint =
    ViewpointData("Viewpoint Title", "This is a viewpoint summary.", 54, 79, 5);
