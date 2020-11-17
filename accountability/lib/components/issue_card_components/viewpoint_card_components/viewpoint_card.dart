import 'package:flutter/material.dart';
import 'expand_viewpoint_dialog.dart';

Widget buildViewpoints(screenWidth, screenHeight, viewpoint) {
  double _currentValue = 5;
  int numAgrees = viewpoint.numAgrees;
  int numDisagrees = viewpoint.numDisagrees;
  int popularityRank = viewpoint.popularityRank;
  return
      // SizedBox(
      //     width: screenWidth,
      //     height: screenHeight,
      //     child:
      Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: SizedBox(
                height: 400,
                width: 400,
                child: Card(
                    child: Column(
                  children: [
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
                                    SelectableText(viewpoint.title,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.black)),
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
                                    SelectableText("$numAgrees Agrees",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    SelectableText("$numDisagrees Disagrees",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    SelectableText(
                                        "#$popularityRank Most Popular",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey))
                                  ])),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: Row(children: [
                                IconButton(
                                    icon: Icon(Icons.flag_rounded, size: 24),
                                    color: Colors.deepPurple,
                                    onPressed: () {}),
                                // IconButton(
                                //     icon: Icon(Icons.message_rounded,
                                //         size: 24, color: Colors.deepPurple),
                                //     onPressed: () {})
                              ]))
                        ]),
                    //Expanded(
                    //  child:
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: SelectableText(viewpoint.summary,
                            minLines: 1,
                            maxLines: 3,
                            style:
                                TextStyle(fontSize: 14, color: Colors.grey))),
                    //),
                    TextButton(
                        child: Text("Expand Viewpoint and View Replies",
                            style: TextStyle(fontSize: 16)),
                        onPressed: () {
                          expandViewpointDialog(viewpoint);
                        }),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //   TextButton(
                          //       child: Text("Supporters"), onPressed: () {}),
                          // TextButton(
                          //     child: Text("Supporting Experts"),
                          //     onPressed: () {}),
                          // TextButton(
                          //     child: Text("Supporting Leaders"),
                          //     onPressed: () {})
                        ]),
                    ButtonBar(alignment: MainAxisAlignment.center, children: [
                      ElevatedButton(child: Text("Agree"), onPressed: () {}),
                      ElevatedButton(child: Text("Disagree"), onPressed: () {}),
                      Slider(
                          value: _currentValue,
                          min: 0,
                          max: 10,
                          onChanged: (double value) {})
                    ])
                  ],
                )),
              )))
      //)
      ;
}

// Widget buildViewpoints(screenWidth, screenHeight, viewpoint) {
//   double _currentValue = 5;
//   int numAgrees = viewpoint.numAgrees;
//   int numDisagrees = viewpoint.numDisagrees;
//   int popularityRank = viewpoint.popularityRank;
//   return
//       // SizedBox(
//       //     width: screenWidth,
//       //     height: screenHeight,
//       //     child:
//       Center(
//           child: Container(
//               padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//               child: SizedBox(
//                 height: 400,
//                 width: 600,
//                 child: Card(
//                     child: Column(
//                   children: [
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 16, horizontal: 16),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SelectableText(viewpoint.title,
//                                         maxLines: 1,
//                                         style: TextStyle(
//                                             fontSize: 36, color: Colors.black)),
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
//                                     SelectableText("$numAgrees Agrees",
//                                         style: TextStyle(
//                                             fontSize: 14, color: Colors.grey)),
//                                     SelectableText("$numDisagrees Disagrees",
//                                         style: TextStyle(
//                                             fontSize: 14, color: Colors.grey)),
//                                     SelectableText(
//                                         "#$popularityRank Most Popular",
//                                         style: TextStyle(
//                                             fontSize: 14, color: Colors.grey))
//                                   ])),
//                           Container(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 16, horizontal: 16),
//                               child: Row(children: [
//                                 IconButton(
//                                     icon: Icon(Icons.flag_rounded, size: 24),
//                                     color: Colors.deepPurple,
//                                     onPressed: () {}),
//                                 IconButton(
//                                     icon: Icon(Icons.message_rounded,
//                                         size: 24, color: Colors.deepPurple),
//                                     onPressed: () {})
//                               ]))
//                         ]),
//                     Expanded(
//                         child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 16, horizontal: 16),
//                             child: SelectableText(viewpoint.summary,
//                                 minLines: 1,
//                                 maxLines: 7,
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.grey)))),
//                     TextButton(
//                         child: Text("Expand Viewpoint and View Replies",
//                             style: TextStyle(fontSize: 16)),
//                         onPressed: () {}),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           TextButton(
//                               child: Text("Supporting Organizations"),
//                               onPressed: () {}),
//                           TextButton(
//                               child: Text("Supporting Experts"),
//                               onPressed: () {}),
//                           TextButton(
//                               child: Text("Supporting Leaders"),
//                               onPressed: () {})
//                         ]),
//                     ButtonBar(alignment: MainAxisAlignment.center, children: [
//                       ElevatedButton(child: Text("Agree"), onPressed: () {}),
//                       ElevatedButton(child: Text("Disagree"), onPressed: () {}),
//                       Slider(
//                           value: _currentValue,
//                           min: 0,
//                           max: 10,
//                           onChanged: (double value) {})
//                     ])
//                   ],
//                 )),
//               )))
//       //)
//       ;
// }

// Widget buildViewpointCard(issueKey) {
//   //get data from backend
//   return Card(
//       clipBehavior: Clip.hardEdge,
//       child: Column(children: [
//         Row(
//           children: [
//             SelectableText(/*issueKey.name*/ issueKey),
//             IconButton(icon: Icon(Icons.flag_rounded), onPressed: () {})
//           ],
//         ),
//         FittedBox(
//           child: SelectableText(/*issueKey.summary*/ "add summary here"),
//         ),
//         TextButton(
//             child: Text("Expand Viewpoint and Show Replies"), onPressed: () {}),
//         Column(children: [
//           SelectableText("# Agrees:"),
//           SelectableText("# Disagrees:")
//         ]),
//         Column(children: [
//           TextButton(
//               child: SelectableText("Supporting Organizations"),
//               onPressed: () {}),
//           TextButton(
//               child: SelectableText("Supporting Leaders"), onPressed: () {})
//         ]),
//         ButtonBar(children: [
//           ElevatedButton(child: Text("Agree"), onPressed: () {}),
//           ElevatedButton(child: Text("Disagree"), onPressed: () {}),
//         ]),
//         ButtonBar(children: [
//           Slider(value: 5, min: 0, max: 10, onChanged: (value) {})
//         ])
//       ]));
// }

/*
Widget _buildViewpointCard(String viewpointName, String viewpointTextSummary,
    String viewpointTextLong) {
  return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(children: [
        Row(
          children: [
            SelectableText(viewpointName),
            IconButton(icon: Icon(Icons.flag), onPressed: () {})
          ],
        ),
        FittedBox(
          child: SelectableText(viewpointTextSummary),
        ),
        TextButton(
            child: Text("Expand Viewpoint and Show Replies"), onPressed: () {}),
        Column(children: [
          SelectableText("# Agrees:"),
          SelectableText("# Disagrees:")
        ]),
        Column(children: [
          TextButton(
              child: SelectableText("Supporting Organizations"),
              onPressed: () {}),
          TextButton(
              child: SelectableText("Supporting Leaders"), onPressed: () {})
        ]),
        ButtonBar(children: [
          ElevatedButton(child: Text("Agree"), onPressed: () {}),
          ElevatedButton(child: Text("Disagree"), onPressed: () {}),
        ]),
        ButtonBar(children: [
          Slider(value: 5, min: 0, max: 10, onChanged: (value) {})
        ])
      ]));
}
*/
