import 'package:flutter/material.dart';
import 'package:accountability/ui/components/screen_components/app_bar.dart';
import 'package:accountability/ui/components/screen_components/left_drawer.dart';
import 'package:accountability/ui/components/screen_components/footer.dart';
import 'package:accountability/util/scroll_bar.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';

class WebScreen extends StatefulWidget {
  final Widget screenBody;

  WebScreen(this.screenBody);
  @override
  State createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  void scrollBarCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height // - kToolbarHeight
        ;

    return Scaffold(
        key: _drawerKey,
        drawer: buildDrawers(context),
        body: SizedBox(
            width: screenWidth,
            height: screenHeight,
            // child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
              Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: Scrollbar(
                      thickness: 15,
                      controller: _controller,
                      interactive: true,
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                          controller: _controller,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                buildAppBar("Issue Page", context, _drawerKey),
                                widget.screenBody,
                              ]),
                              buildFooter()
                            ],
                          )))),

              // FlutterWebScroller(
              //   scrollBarCallBack,
              //   scrollBarBackgroundColor: Colors.white,
              //   scrollBarWidth: 20.0,
              //   dragHandleColor: Colors.red,
              //   dragHandleBorderRadius: 2.0,
              //   dragHandleHeight: 40.0,
              //   dragHandleWidth: 15.0,
              // ),
              //ScrollBar(scrollBarCallBack)
            ]))); //)
    // body: Center(
    //     child: SingleChildScrollView(
    //         child: Column(children: [
    //   TabBarScreen(),
    //   //Transform(
    //   //  transform: Matrix4.identity()..scale(1),
    //   //child: buildIssue(screenWidth, screenHeight, sampleIssue))
    //   buildFooter()
    // ]))),
  }
}
