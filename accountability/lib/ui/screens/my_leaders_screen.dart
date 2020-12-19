import 'package:accountability/ui/styles.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:accountability/ui/web_app/web_screen_builder.dart';
import 'package:flutter/material.dart';
import 'package:accountability/ui/components/page_summary_card.dart';

class MyLeadersScreenBody extends StatelessWidget {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return _buildBody(screenWidth, screenHeight);
  }
}

Widget _buildBody(screenWidth, screenHeight) {
  var numColumns = screenWidth ~/ (400 + 32);
  return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("My Leaders", style: title2())),
              Expanded(
                child: GridView.count(
                    childAspectRatio: 3 / 2,
                    crossAxisCount: numColumns,
                    mainAxisSpacing: 0,
                    children: [
                      _myLeaders('002'),
                      _myLeaders('002'),
                      _myLeaders('002'),
                      _myLeaders('002'),
                      _myLeaders('002'),
                      _myLeaders('002'),
                      _myLeaders('002'),
                      _myLeaders('002'),
                      _myLeaders('002'),
                      // Container(
                      //     padding:
                      //         EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      //     child: ElevatedButton(
                      //         child: Text("Add a Leader"), onPressed: () {}))
                    ]),
              )
            ],
          )));
}

Widget _myLeaders(leader) {
  return PageSummaryCard(leader);
}
