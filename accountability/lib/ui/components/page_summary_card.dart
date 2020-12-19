import 'package:accountability/ui/styles.dart';
import 'package:accountability/logic/internal_classes/data_structures.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:accountability/routes.dart';
import 'page_full_card_async.dart';

class PageSummaryCard extends StatelessWidget {
  final String pageID;
  @override
  PageSummaryCard(this.pageID);
  @override
  Widget build(BuildContext context) {
    Future<PageSummaryData> page = getPageSummary(pageID);
    return FutureBuilder<PageSummaryData>(
        future: page,
        builder:
            (BuildContext context, AsyncSnapshot<PageSummaryData> snapshot) {
          if (snapshot.hasData == true) {
            return buildSummaryCard(pageID, snapshot.data, context);
          } else
            return buildSummaryCard(pageID, summaryLoaderData, context);
        });
  }
}

Widget buildSummaryCard(pageID, page, context) {
  return Center(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SizedBox(
            height: 400,
            width: 400,
            child: Card(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(page.image,
                    width: 400, height: 200, fit: BoxFit.cover),
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
                                  "${page.pageName}",
                                  style: title3(),
                                ),
                                SelectableText("${page.subtitle1}",
                                    style: subtitle1()),
                                SelectableText("${page.subtitle2}",
                                    style: subtitle1()),
                                SelectableText("${page.subtitle3}",
                                    style: subtitle1())
                              ]),
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SelectableText("${page.data1}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                SelectableText("${page.data2}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                SelectableText("${page.data3}",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey))
                              ])),
                      Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Row(children: [
                            IconButton(
                                icon: Icon(Icons.message_rounded, size: 24),
                                color: Colors.deepPurple,
                                onPressed: () {}),
                          ]))
                    ]),
                TextButton(
                    child: Text("View More", style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.pushNamed(context, PageScreenRoute,
                          arguments: pageID);
                    })
              ],
            )),
          )));
}
