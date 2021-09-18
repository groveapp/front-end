import 'package:flutter/material.dart';

Widget buildFooter() {
  return Container(
      height: 30,
      decoration: BoxDecoration(
        // border: Border.all(
        //  color: Colors.black,
        // width: 2,
        //),
        //borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      child: Expanded(child: Center(child: Text('Add Footer Here'))));
}

// Widget buildFooter() {
//   return Expanded(
//     child: Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         width: double.infinity,
//         color: Colors.red,
//         padding: EdgeInsets.all(12.0),
//         child: Text(
//           'FOOTER',
//           textAlign: TextAlign.center,
//         ),
//       ),
//     ),
//   );
// }
