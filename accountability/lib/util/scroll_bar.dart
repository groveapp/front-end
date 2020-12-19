import 'package:flutter/material.dart';

// class ScrollBar {
//   static void registerWith(Registrar registrar) {}
// }

class ScrollBar extends StatefulWidget {
  final Function scrollBarCallBack;
  ScrollBar(this.scrollBarCallBack);
  @override
  State createState() => _ScrollBarState();
}

class _ScrollBarState extends State<ScrollBar> {
  static double _offset = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        height: MediaQuery.of(context).size.height,
        width: 20,
        child: Container(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              child: Container(
                height: 50,
                width: 10,
                margin: EdgeInsets.only(left: 5, right: 5, top: _offset),
                color: Colors.blue,
              ),
              onVerticalDragUpdate: (dragUpdate) {
                widget.scrollBarCallBack(dragUpdate);
                setState(() {
                  _offset = dragUpdate.globalPosition.dy;
                });
              },
            )));
  }
}

// class LandingPage extends StatefulWidget {
//   LandingPage({Key key}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return _LandingPageState();
//   }
// }

// class _LandingPageState extends State<LandingPage> {
//   ScrollController _controller;

//   @override
//   void initState() {
//       //Initialize the  scrollController
//       _controller = ScrollController();
//       super.initState();
//   }

//   void scrollCallBack(DragUpdateDetails dragUpdate) {
//     setState(() {
//       // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
//        _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Container(
//             child: SingleChildScrollView(
//               //Assign the controller to my scrollable widget
//               controller: _controller,
//               child: Column(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.black,
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.red,
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.green,
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.blue,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ),
//         ],
//       ),
//     );
//   }
// }
