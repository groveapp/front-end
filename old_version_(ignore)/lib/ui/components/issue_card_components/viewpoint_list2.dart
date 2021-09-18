import 'package:flutter/material.dart';
import 'package:accountability/ui/components/issue_card_components/viewpoint_card_components/viewpoint_card.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

Widget buildViewpointList2(screenWidth, screenHeight, sampleViewpoint) {
  List<Widget> viewpointList = [
    buildViewpoints(screenWidth, screenHeight, sampleViewpoint)
  ];
  void createList() {
    for (var i = 0; i <= 5; i++) {
      viewpointList
          .add(buildViewpoints(screenWidth, screenHeight, sampleViewpoint));
    }
  }

  createList();
  print(viewpointList);
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
          child: DynamicHorizontalDemo(
            viewpointList,
            //  screenWidth, screenHeight, sampleViewpoint
          )),
    ])
  ]);
}

class DynamicHorizontalDemo extends StatefulWidget {
  final List<Widget> viewpointList;
  // final screenHeight;
  // final screenWidth;
  // final sampleViewpoint;

  DynamicHorizontalDemo(
    this.viewpointList,
    //  this.screenHeight, this.screenWidth,
    // this.sampleViewpoint
  );
  @override
  _DynamicHorizontalDemoState createState() => _DynamicHorizontalDemoState();
}

class _DynamicHorizontalDemoState extends State<DynamicHorizontalDemo> {
  var _focusedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
      child: widget.viewpointList[index],
    );
  }

  ///Override default dynamicItemSize calculation
  // double customEquation(double distance) {
  //   // return 1-min(distance.abs()/500, 0.2);
  //   return 1 - (distance / 1000);
  // }

  Widget build(BuildContext context) {
    return ScrollSnapList(
      onItemFocus: _onItemFocus,
      itemSize: 200,
      itemBuilder: _buildListItem,
      itemCount: widget.viewpointList.length,
      dynamicItemSize: true,
      // dynamicSizeEquation: customEquation, //optional
    );
  }

// Widget _buildItemDetail() {
//     if (_focusedIndex < 0)
//       return Container(
//         height: 250,
//         child: Text("Nothing selected"),
//       );

//     if (data.length > _focusedIndex)
//       return Container(
//         height: 250,
//         child: Text("index $_focusedIndex: ${data[_focusedIndex]}"),
//       );

//     return Container(
//       height: 250,
//       child: Text("No Data"),
//     );
//   }

}
