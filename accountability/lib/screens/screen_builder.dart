import 'package:flutter/material.dart';
class Screen extends StatefulWidget {
  @override
  State createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Issue Page", context, _drawerKey),
      body: 
      Center(
          child: SingleChildScrollView(
              child: Column(children: [
        
        //Transform(
          //  transform: Matrix4.identity()..scale(1),
            //child: buildIssue(screenWidth, screenHeight, sampleIssue))
        ),
        buildFooter()
      ]))),
      drawer: buildDrawers(context),
      // bottomSheet: buildFooter(),
    );
  }
}
