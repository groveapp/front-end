import 'package:accountability/ui/components/issue_card_components/issue_card2.dart';
import 'package:accountability/ui/components/screen_components/app_bar.dart';
import 'package:accountability/ui/components/screen_components/left_drawer.dart';
//import 'package:accountability/ui/components/viewpoint_scroller.dart';
import 'package:flutter/material.dart';
import 'package:accountability/ui/components/issue_card_components/issue_card.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:accountability/ui/components/screen_components/footer.dart';

class IssueScreen extends StatefulWidget {
  @override
  State createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Issue Page", context, _drawerKey),
      body: Center(
          child: SingleChildScrollView(
              child: Column(children: [
        Transform(
            transform: Matrix4.identity()..scale(1),
            child: buildIssue2(
              screenWidth,
              screenHeight,
              sampleIssue,
              context,
            )),
        buildFooter()
      ]))),
      drawer: buildDrawers(context),
      // bottomSheet: buildFooter(),
    );
  }
}
