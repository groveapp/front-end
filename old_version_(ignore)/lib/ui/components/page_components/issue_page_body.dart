import 'package:accountability/async/page_full_card_async.dart';
import 'package:accountability/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:accountability/ui/components/add_viewpoint_dialog.dart';
import 'package:accountability/ui/components/issue_card_components/full_chart_widget.dart';
import 'package:accountability/ui/components/issue_card_components/data_table.dart';
import 'package:accountability/ui/components/issue_card_components/related_bills_list.dart';
import 'package:accountability/ui/components/issue_card_components/similar_issues_list.dart';
import 'package:accountability/ui/components/issue_card_components/viewpoint_list.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:accountability/ui/components/issue_card_components/viewpoint_card_components/viewpoint_card.dart';
import 'package:accountability/ui/components/issue_card_components/viewpoint_list2.dart';
import 'package:flutter/rendering.dart';
import 'package:accountability/logic/internal_classes/data_structures.dart';

class IssuePageBody extends StatefulWidget {
  final PageFullData page;
  @override
  IssuePageBody(this.page);

  @override
  State createState() => _IssuePageBodyState();
}

class _IssuePageBodyState extends State<IssuePageBody> {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return Column(children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTopViewpoint(screenWidth, screenHeight, sampleViewpoint),
            buildChartArea(),
          ]),
      Container(
          height: 400,
          child: Expanded(
            child:
                // GridView.count(
                // childAspectRatio: 3 / 2,
                // crossAxisCount: 2,
                // mainAxisSpacing: 0,
                // children: [
                //   buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
                //   buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
                //   buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
                //   Container(
                //     height: 20,
                //     width: 40,
                //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                //       child: ElevatedButton(
                //           child: Text("More Viewpoints"), onPressed: () {}))
                // ]),
                ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                  buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
                  buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
                  buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
                  Container(
                      height: 20,
                      width: 40,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: ElevatedButton(
                          child: Text("More Viewpoints"), onPressed: () {}))
                ]),
          )),
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildDataTable(),
            buildRelatedBillsList(),
            buildSimilarIssuesList()
          ])
    ]);
  }
}

Widget buildTopViewpoint(screenWidth, screenHeight, sampleViewpoint) {
  return buildViewpoints(screenWidth, screenHeight, sampleViewpoint);
}
