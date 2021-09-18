import 'package:flutter/material.dart';
import 'package:accountability/ui/components/sign_in_dialog.dart';
import 'package:accountability/ui/components/sign_up_dialog.dart';
import 'package:accountability/ui/web_app/web_screen_builder.dart';

class HomeScreenBody extends StatefulWidget {
  @override
  State createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;

    return _buildBody(screenWidth, screenHeight);
  }

  Widget _buildBody(screenWidth, screenHeight) {
    final AlertDialog dialogSignUp = signUpDialog();
    final AlertDialog dialogSignIn = signInDialog();
    return SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Center(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(children: [
                  Container(
                    clipBehavior: Clip.none,
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Welcome to The Accountability App',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "A place where you can add your voice to tell your leaders what you think.",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  showDialog<void>(
                                      context: context,
                                      builder: (context) => dialogSignIn);
                                },
                                child: Text("Sign In")),
                            ElevatedButton(
                                onPressed: () {
                                  showDialog<void>(
                                      context: context,
                                      builder: (context) => dialogSignUp);
                                },
                                child: Text("Sign Up")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  issueList()
                ]))));
  }
}
//This section will just pull issues from the trending issues in the area of the user's IP address, and will display the viewpoints and politicians in a compressed way

Widget issueList() {
  return Column(children: [
    Card(
        child: Column(children: [
      ListTile(
          title: Text("Trending Issue #1"),
          subtitle: Text("Some things about Trending Issue #1")),
    ])),
    Card(
        child: Column(children: [
      ListTile(
          title: Text("Trending Issue #2"),
          subtitle: Text("Some things about Trending Issue #2")),
    ])),
    Card(
        child: Column(children: [
      ListTile(
          title: Text("Trending Issue #3"),
          subtitle: Text("Some things about Trending Issue #3")),
    ])),
  ]);
}

//IF SCREEN IS BELOW A CERTAIN SIZE, DO HORIZONTAL SCROLL INSTEAD

/*
Widget issueList() {
  final _loadedIssues = [];
  return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _loadedIssues.length) {
          _loadedIssues.addAll(_trendingIssuesList.take(10));
        }
        return _buildRow(_loadedIssues[index]);
      });
}

Widget _buildRow(loadedIssue) {
  return Card(
      child: ListTile(
          title: Text("Trending Issue $loadedIssue.name"),
          subtitle: Text("Some things about Trending Issue #1")));
}

 _trendingIssuesList() {



}

*/
