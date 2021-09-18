import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:quill_delta/quill_delta.dart';
// import 'package:zefyr/zefyr.dart';

//include "save as draft"
//no markdown needed initially

Widget addViewpointDialog() {
  return AlertDialog(
    title: Text("Add a Viewpoint"),
    contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // TextFormField(
        //   decoration: InputDecoration(
        //     labelText: 'Viewpoint Title',
        //     suffixIcon: Icon(
        //       Icons.check_circle,
        //     ),
        //     enabledBorder: UnderlineInputBorder(
        //       borderSide: BorderSide(color: Color(0xFF6200EE)),
        //     ),
        //   ),
        // ),
        Container(height: 300, width: 300, child: EditorPage()),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ElevatedButton(
                onPressed: () {}, child: Text("Longer Viewpoint Explanation")))
      ],
    ),
  );
}

class EditorPage extends StatefulWidget {
  @override
  EditorPageState createState() => EditorPageState();
}

class EditorPageState extends State<EditorPage> {
  final viewpointController =
      TextEditingController(text: "Add your viewpoint here");

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    viewpointController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return TextFormField(
      controller: viewpointController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        labelText: 'Viewpoint Summary',
        suffixIcon: Icon(
          Icons.check_circle,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
      onEditingComplete: () {
        //addViewpoint(context, viewpointController.text);
      },
    );
  }
}

// class EditorPageState extends State<EditorPage> {
//   /// Allows to control the editor and the document.
//   ZefyrController _controller;

//   /// Zefyr editor like any other input field requires a focus node.
//   FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     // Here we must load the document and pass it to Zefyr controller.
//     final document = _loadDocument();
//     _controller = ZefyrController(document);
//     _focusNode = FocusNode();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Note that the editor requires special `ZefyrScaffold` widget to be
//     // one of its parents.
//     return Theme(
//         data: ThemeData(hoverColor: Colors.grey, focusColor: Colors.grey),
//         child: Column(children: [
//           ZefyrEditor(
//             padding: EdgeInsets.all(16),
//             controller: _controller,
//             focusNode: _focusNode,
//           ),
//           ZefyrToolbar.basic(controller: _controller)
//         ]));
//   }

//   /// Loads the document to be edited in Zefyr.
//   NotusDocument _loadDocument() {
//     // For simplicity we hardcode a simple document with one line of text
//     // saying "Zefyr Quick Start".
//     // (Note that delta must always end with newline.)
//     final Delta delta = Delta()..insert("Add your viewpoint summary here.\n");
//     return NotusDocument.fromDelta(delta);
//   }
// }
