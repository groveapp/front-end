import 'package:accountability/styles.dart';
import 'package:flutter/material.dart';
import 'package:accountability/components/add_viewpoint_dialog.dart';
import 'package:accountability/components/issue_card_components/full_chart_widget.dart';
import 'package:accountability/components/issue_card_components/data_table.dart';
import 'package:accountability/components/issue_card_components/related_bills_list.dart';
import 'package:accountability/components/issue_card_components/similar_issues_list.dart';
import 'package:accountability/components/issue_card_components/viewpoint_list.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:accountability/components/issue_card_components/viewpoint_card_components/viewpoint_card.dart';
import 'package:accountability/components/issue_card_components/viewpoint_list2.dart';
import 'package:flutter/rendering.dart';
import 'package:accountability/util/data_structures.dart';
import 'package:accountability/components/page_components/issue_page_body.dart';

//FIX THE SCROLL VIEW AND HEIGHT AND WIDTH AND SCREEN_
//Fix summary text

class FullCard extends StatelessWidget {
  final PageFullData page;
  FullCard(this.page);
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return buildFullCard(page, screenWidth, screenHeight);
  }
}

Widget buildFullCard(PageFullData page, screenWidth, screenHeight) {
  return Center(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: SingleChildScrollView(
                child: Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Image.asset(page.image,
                    //width: 400, height: 200, fit: BoxFit.cover),
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
                                    SelectableText(
                                      "${page.pageSummaryData.pageName}",
                                      style: title3(),
                                    ),
                                    SelectableText(
                                        "${page.pageSummaryData.subtitle1}",
                                        style: subtitle1()),
                                    SelectableText(
                                        "${page.pageSummaryData.subtitle2}",
                                        style: subtitle1()),
                                    SelectableText(
                                        "${page.pageSummaryData.subtitle3}",
                                        style: subtitle1())
                                  ]),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                        "${page.pageSummaryData.data1}",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    SelectableText(
                                        "${page.pageSummaryData.data2}",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    SelectableText(
                                        "${page.pageSummaryData.data3}",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey))
                                  ])),
                          // Container(
                          //     padding:
                          //         EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          //     child: Row(children: [
                          //       IconButton(
                          //           icon: Icon(Icons.message_rounded, size: 24),
                          //           color: Colors.deepPurple,
                          //           onPressed: () {}),
                          //     ]))
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Column(children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: ElevatedButton(
                                      child: Text("Follow Issue"),
                                      onPressed: () {}),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  child: ElevatedButton(
                                      child: Text("Share"), onPressed: () {}),
                                ),
                                // Container(
                                //   padding: EdgeInsets.all(4),
                                //   child: ElevatedButton(
                                //       child: Text("Button 3"), onPressed: () {}),
                                //)
                                // Container(
                                //     padding: EdgeInsets.all(4), child: page.button3)
                              ]))
                        ]),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        height: 100,
                        child: Expanded(child: page.summaryText)),
                    buildPageBody(page)
                  ],
                )),
              ))));
}

buildPageBody(page) {
  print(page.pageType);
  if (page.pageType == "issue") {
    return buildIssuePageBody(page);
  } else if (page.pageType == "leader") {
    return buildLeaderPageBody(page);
  } else if (page.pageType == "organization") {
    return buildOrganizationPageBody(page);
  } else {
    throw ("no page type");
  }
}

buildIssuePageBody(page) {
  return IssuePageBody(page);
}

buildLeaderPageBody(page) {
  return LeaderPageBody(page);
}

buildOrganizationPageBody(page) {
  return OrganizationPageBody(page);
}

class LeaderPageBody {
  PageFullData page;
  @override
  LeaderPageBody(this.page);
}

class OrganizationPageBody {
  PageFullData page;
  @override
  OrganizationPageBody(this.page);
}
