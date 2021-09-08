// get size of screen
// wrap with nav bar and footer and scrollbar

import 'package:flutter/material.dart';
import 'nav_bar.dart';
import 'footer.dart';

class WebScreen extends StatefulWidget {
  final Widget screenBody;
  WebScreen(this.screenBody);

  @override
  State createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final _vertical_controller = ScrollController();
  final _horizontal_controller = ScrollController();

  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height // - kToolbarHeight
        ;
    return Scaffold(
        body: SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Scrollbar(
        thickness: 15,
        controller: _horizontal_controller,
        interactive: true,
        child: SingleChildScrollView(
            controller: _horizontal_controller,
            scrollDirection: Axis.horizontal,
            child: Container(
                width: screenWidth,
                child: Scrollbar(
                    thickness: 15,
                    controller: _vertical_controller,
                    interactive: true,
                    isAlwaysShown: true,
                    child: SingleChildScrollView(
                        controller: _vertical_controller,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  buildNavBar(context),
                                  Container(
                                      constraints: BoxConstraints(
                                          minWidth: screenWidth <= 1000
                                              ? 0.8 * screenWidth
                                              : 800,
                                          maxWidth: 800),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      child: widget.screenBody),
                                ]),
                            //buildFooter()
                          ],
                        ))))),
      ),
    ));
  }
}
