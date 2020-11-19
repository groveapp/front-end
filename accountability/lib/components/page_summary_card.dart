import 'package:accountability/styles.dart';
import 'package:flutter/material.dart';

Widget buildSummaryCard(page) {
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
                    onPressed: () {}),
              ],
            )),
          )));
}
