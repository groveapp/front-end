import 'package:flutter/material.dart';
import 'package:accountability/components/issue_card_components/viewpoint_card_components/viewpoint_card.dart';

Widget buildViewpointList(screenWidth, screenHeight, sampleViewpoint) {
  return Column(children: [
    Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child:
            SelectableText("Viewpoints (5)", style: TextStyle(fontSize: 36))),

    //),
    Row(children: [
      Container(
        width: 800,
        height: 400,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        color: Colors.grey,
        // child: ListView.builder(
        //     itemCount: 3,
        //     //itemExtent: itemSize,
        //     //controller: _controller,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (sampleViewpoint, index) {
        //       return buildViewpoints(
        //           screenWidth, screenHeight, sampleViewpoint);
        //     })),

        // child: ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
        //     buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
        //     buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
        //     buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
        //     Container(
        //         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        //         child: ElevatedButton(
        //             child: Text("Add a Viewpoint"), onPressed: () {}))
        //   ],
        // ),
        child: GridView.count(
            childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            children: [
              buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
              buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
              buildViewpoints(screenWidth, screenHeight, sampleViewpoint),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ElevatedButton(
                      child: Text("More Viewpoints"), onPressed: () {}))
            ]),
      ),
    ])
  ]);
}
