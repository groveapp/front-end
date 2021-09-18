// import 'package:flutter/material.dart';

// class PageCard extends StatefulWidget {
//   final PageData page;
//   @override
//   State createState() => _PageCardState();
// }

// class _PageCardState extends State<PageCard> {
//   Widget build(BuildContext context) {
//     return buildPageCard(widget.page);
//   }
// }

// class IssueCard extends PageCard {}

// Widget buildPageCard(page) {
//   return SizedBox(
//       child: Center(
//           child: Container(
//               padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//               child: SingleChildScrollView(
//                 child: Card(
//                     child: Column(
//                   children: [
//                     Image.asset(
//                       page.image,
//                       height: 400,
//                       width: screenWidth,
//                       fit: BoxFit.fitHeight,
//                     ),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 0, horizontal: 0),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 16, horizontal: 16),
//                                       child: SelectableText(page.pageName,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                               fontSize: 48,
//                                               color: Colors.black)),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 0, horizontal: 16),
//                                       child: SelectableText(page.subtitle1,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                               fontSize: 24,
//                                               color: Colors.grey)),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 0, horizontal: 16),
//                                       child: SelectableText(page.subtitle2,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                               fontSize: 24,
//                                               color: Colors.grey)),
//                                     ),
//                                     Container(
//                                         padding: EdgeInsets.symmetric(
//                                             vertical: 16, horizontal: 16),
//                                         child: SelectableText(page.summary,
//                                             minLines: 1,
//                                             maxLines: 7,
//                                             style: TextStyle(
//                                                 fontSize: 16,
//                                                 color: Colors.grey))),
//                                     Container(
//                                         padding: EdgeInsets.symmetric(
//                                             vertical: 4, horizontal: 16),
//                                         child: TextButton(
//                                             child:
//                                                 Text("View Expert Briefings"),
//                                             onPressed: () {})),
//                                   ]),
//                             ),
//                           ),
//                           Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 16, horizontal: 16),
//                               child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SelectableText(page.data1,
//                                         style: TextStyle(
//                                             fontSize: 14, color: Colors.grey)),
//                                     SelectableText(page.data2,
//                                         style: TextStyle(
//                                             fontSize: 14, color: Colors.grey)),
//                                     SelectableText(page.data3,
//                                         style: TextStyle(
//                                             fontSize: 14, color: Colors.grey))
//                                   ])),
//                           Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 16, horizontal: 16),
//                               child: Column(children: [
//                                 Container(
//                                   padding: EdgeInsets.all(4),
//                                   child: ElevatedButton(
//                                       child: Text(page.button1),
//                                       onPressed: () {}),
//                                 ),
//                                 Container(
//                                     padding: EdgeInsets.all(4),
//                                     child: ElevatedButton(
//                                         child: Text("Share"), onPressed: () {}))
//                               ]))
//                         ]),
//                     Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [page.widget1, page.widget2]),
//                     Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [page.widget3, page.widget4, page.widget5])
//                   ],
//                 )),
//               )))
//       //)
//       );
// }
