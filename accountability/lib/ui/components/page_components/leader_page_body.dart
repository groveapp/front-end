//add new leader activity

import 'package:flutter/material.dart';
import 'package:accountability/ui/components/page_full_card.dart';
import 'package:accountability/logic/internal_classes/data_structures.dart';
import 'package:accountability/async/page_full_card_async.dart';

class LeaderPageBody extends StatefulWidget {
  final PageFullData page;
  @override
  LeaderPageBody(this.page);
  @override
  State createState() => _LeaderPageBodyState();
}

class _LeaderPageBodyState extends State<LeaderPageBody> {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(children: [
          leaderDivergence(),
          leaderActivity(),
        ]));
  }
}

Widget leaderDivergence() {
  return Container(height: 100);
}

Widget leaderActivity() {
  return Text("Leader Activity");
}
