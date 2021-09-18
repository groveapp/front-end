import 'package:accountability/ui/styles.dart';
import 'package:flutter/material.dart';

Widget followedPage(page) {
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
                    Image.asset('images/barack-obama-main.jpg',
                        width: 400, height: 200, fit: BoxFit.cover),
                    //replace this with chart
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
                                    SelectableText("${page.organizationLevel}",
                                        style: subtitle1()),
                                    SelectableText("${page.organizationArea}",
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
                                        "${page.numViewpoints} Viewpoints",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    SelectableText(
                                        "${page.numResponses} Responses",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey))
                                  ])),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: Row(children: [
                                IconButton(
                                    icon: Icon(Icons.message_rounded, size: 24),
                                    color: Colors.deepPurple,
                                    onPressed: () {}),
                              ]))
                        ]),
                    TextButton(
                        child:
                            Text("More Info", style: TextStyle(fontSize: 16)),
                        onPressed: () {}),
                  ],
                )),
              )))
      //)
      ;
}
