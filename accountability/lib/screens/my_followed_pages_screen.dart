import 'package:accountability/styles.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:accountability/web_app/web_screen_builder.dart';
import 'package:flutter/material.dart';
import 'package:accountability/components/page_summary_card.dart';

class MyFollowedPagesScreenBody extends StatelessWidget {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    var numColumns = screenWidth ~/ (400 + 32);
    return _buildBody(numColumns);
  }
}

Widget _buildBody(numColumns) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text("Followed Pages", style: title2())),
          Expanded(
            child: GridView.count(
                childAspectRatio: 3 / 2,
                crossAxisCount: numColumns,
                mainAxisSpacing: 0,
                children: [
                  _followedPage(sampleIssuePage),
                  _followedPage(sampleIssuePage),
                  _followedPage(sampleIssuePage),
                  _followedPage(sampleIssuePage),
                  _followedPage(sampleIssuePage),
                  _followedPage(sampleIssuePage),
                  _followedPage(sampleIssuePage),
                  _followedPage(sampleIssuePage),
                  // Container(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  //     child: ElevatedButton(
                  //         child: Text("Add a Leader"), onPressed: () {}))
                ]),
          )
        ],
      ));
}

Widget _followedPage(page) {
  return PageSummaryCard(page);
}
