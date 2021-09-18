import 'package:flutter/material.dart';
import 'package:accountability/ui/components/screen_components/app_bar.dart';
import 'package:accountability/ui/components/screen_components/left_drawer.dart';
import 'package:accountability/ui/components/screen_components/tab_bar_web.dart';
import 'package:accountability/ui/components/screen_components/footer.dart';

class ScreenBody extends StatefulWidget {
  @override
  State createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return Scaffold(
      key: _drawerKey,

      body: Center(
          child: SingleChildScrollView(
              child: Column(
        children: [
          buildAppBar("Issue Page", context, _drawerKey),
          TabBarScreenBody(),
          buildFooter()
        ],
      ))),

      // appBar: buildAppBar("Issue Page", context, _drawerKey),
      // body: Center(
      //     child: SingleChildScrollView(
      //         child: Column(children: [
      //   TabBarScreen(),
      //   //Transform(
      //   //  transform: Matrix4.identity()..scale(1),
      //   //child: buildIssue(screenWidth, screenHeight, sampleIssue))
      //   buildFooter()
      // ]))),
      drawer: buildDrawers(context),
    );
  }
}
