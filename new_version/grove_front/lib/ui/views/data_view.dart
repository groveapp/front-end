import 'package:flutter/material.dart';
import 'package:grove_front/core/providers/viewpoint_provider.dart';
import 'package:grove_front/core/services/api_helper.dart';
import 'package:grove_front/ui/shared/buttons.dart';
import 'package:grove_front/ui/shared/charts.dart';
import 'package:grove_front/ui/shared/web_wrapper.dart';
import 'package:grove_front/ui/shared/cards.dart';
import 'package:grove_front/core/models/data_models/issue.dart';
import 'package:grove_front/core/models/data_models/viewpoint.dart';
import 'package:grove_front/core/providers/issue_provider.dart';
import 'package:provider/provider.dart';
import 'package:grove_front/core/models/page_models/issue_page_model.dart';
import 'package:grove_front/ui/shared/typography.dart';
import 'package:share_plus/share_plus.dart';

class IssuePage extends StatefulWidget {
  // accept passed arguments from nav here
  final issueId;
  IssuePage(this.issueId);

  @override
  State createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  bool isLoading = false;

  //add needed data models here: late List<MessageModel> messageList;
  late Issue issue;
  late List<Viewpoint> viewpoints;

  //add needed data providers here: MessageProvider messageProvider = new MessageProvider();
  IssueProvider issueProvider = new IssueProvider();
  ViewpointProvider viewpointProvider = new ViewpointProvider();

  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    // add method to fetch here: messageList = await messageProvider.fetchPosts();
    issue = await issueProvider.getIssueById(widget.issueId);
    viewpoints = await viewpointProvider.getViewpointsByIssue(widget.issueId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return WebScreen(Center(
        child: isLoading
            ? CircularProgressIndicator()
            :
            //add code here

            ViewpointApprovalChart(viewpointList: viewpoints)));
  }
}
