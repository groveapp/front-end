import 'package:accountability/components/issue_card_components/issue_card2.dart';
import 'package:accountability/screens/empty.dart/issue_page_skeleton.dart';
import 'package:accountability/web_app/web_screens/issue_screen_web.dart';
//import 'package:accountability/web_app/web_screens/home_screen.dart';

import '../web_screen_builder.dart';
import 'package:flutter/material.dart';
import 'package:accountability/components/screen_components/tab_bar_web.dart';
import 'package:accountability/components/page_summary_card.dart';
import 'package:accountability/util/sample_data.dart';

class TestScreen extends StatelessWidget {
  final int selectedPage;
  TestScreen({this.selectedPage = 0});
  Widget build(BuildContext context) {
    return WebScreen(TabBarScreenBody(
      selectedPage: selectedPage,
    ));
  }
}
