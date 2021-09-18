//import 'package:accountability/ui/components/viewpoint_scroller.dart';
import 'package:flutter/material.dart';
import 'package:accountability/ui/components/issue_card_components/full_chart_widget.dart';
import 'package:accountability/ui/components/issue_card_components/data_table.dart';
import 'package:accountability/ui/components/issue_card_components/related_bills_list.dart';
import 'package:accountability/ui/components/issue_card_components/similar_issues_list.dart';
import 'package:accountability/ui/components/issue_card_components/viewpoint_list.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:accountability/ui/components/issue_card_components/viewpoint_card_components/viewpoint_card.dart';
import 'package:accountability/ui/components/issue_card_components/viewpoint_list2.dart';

//ADD PICTURE BANNER TO THE TOP

Widget buildCard(screenWidth, screenHeight, issue) {
  int numResponses = issue.numResponses;
  int numExpertResponses = issue.numExpertResponses;
  int popularityRank = issue.popularityRank;
  return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // child:
              // SizedBox(
              //   height: 600,
              //   width: 1000,
              child: SingleChildScrollView(
                  child: Card(
                child: Column(children: [
                  // Image.asset(
                  //   issue.image,
                  //   height: 400,
                  //   width: screenWidth,
                  //   fit: BoxFit.fitHeight,
                  // ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: SelectableText(issue.name,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 48, color: Colors.black)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 16),
                                    child: SelectableText(
                                        issue.organizationLevel,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.grey)),
                                  ),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16),
                                      child: SelectableText(issue.summary,
                                          minLines: 1,
                                          maxLines: 7,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey))),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 16),
                                      child: TextButton(
                                          child: Text("View Expert Briefings"),
                                          onPressed: () {})),
                                ]),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText("$numResponses Responses",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                  SelectableText(
                                      "$numExpertResponses Expert Responses",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                  SelectableText(
                                      "#$popularityRank Most Popular",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey))
                                ])),
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
                                      child: Text("Share"), onPressed: () {}))
                            ]))
                      ]),
                ]),
              )))));
}
