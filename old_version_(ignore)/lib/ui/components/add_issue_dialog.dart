import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:quill_delta/quill_delta.dart';
//import 'package:zefyr/zefyr.dart';

Widget addIssueDialog() {
  return AlertDialog(
    title: Text("Add a Viewpoint"),
    contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Viewpoint Title',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
        Container(height: 300, width: 300, child: EditorPage()),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ElevatedButton(onPressed: () {}, child: Text("Sign In")))
      ],
    ),
  );
}

class EditorPage extends StatefulWidget {
  @override
  EditorPageState createState() => EditorPageState();
}

class EditorPageState extends State<EditorPage> {
  /// Allows to control the editor and the document.
  //ZefyrController _controller;

  /// Zefyr editor like any other input field requires a focus node.
  // FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Here we must load the document and pass it to Zefyr controller.
    // final document = _loadDocument();
    //_controller = ZefyrController(document);
    // _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // Note that the editor requires special `ZefyrScaffold` widget to be
    // one of its parents.
    return Theme(
        data: ThemeData(hoverColor: Colors.grey, focusColor: Colors.grey),
        child: Column(children: [
          // ZefyrEditor(
          //   padding: EdgeInsets.all(16),
          //   controller: _controller,
          //   focusNode: _focusNode,
          // ),
          // ZefyrToolbar.basic(controller: _controller)
        ]));
  }

  /// Loads the document to be edited in Zefyr.
  // NotusDocument _loadDocument() {
  // For simplicity we hardcode a simple document with one line of text
  // saying "Zefyr Quick Start".
  // (Note that delta must always end with newline.)
  // final Delta delta = Delta()..insert("Add your viewpoint summary here.\n");
  // return NotusDocument.fromDelta(delta);
  // }
}
