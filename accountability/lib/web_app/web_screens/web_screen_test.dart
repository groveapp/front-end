import '../web_screen_builder.dart';
import 'package:flutter/material.dart';
import 'package:accountability/components/screen_components/tab_bar.dart';
import 'package:accountability/components/page_summary_card.dart';
import 'package:accountability/util/sample_data.dart';

class TestScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(buildSummaryCard(sampleOrganizationPage));
  }
}
