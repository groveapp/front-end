import 'package:flutter/material.dart';
import 'package:accountability/components/screen_components/app_bar.dart';
import 'package:accountability/components/screen_components/left_drawer.dart';
import 'package:accountability/components/screen_components/footer.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class WebScreen extends StatefulWidget {
  final Widget screenBody;

  WebScreen(this.screenBody);

  @override
  State createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return Scaffold(
      key: _drawerKey,
      drawer: buildDrawers(context),
      body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: //Center(
              //child:
              SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                buildAppBar("Issue Page", context, _drawerKey),
                widget.screenBody,
              ]),
              buildFooter()
            ],
          )))
      //)
      ,
      // body: Center(
      //     child: SingleChildScrollView(
      //         child: Column(children: [
      //   TabBarScreen(),
      //   //Transform(
      //   //  transform: Matrix4.identity()..scale(1),
      //   //child: buildIssue(screenWidth, screenHeight, sampleIssue))
      //   buildFooter()
      // ]))),
    );
  }
}
