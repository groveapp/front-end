import 'package:flutter/material.dart';
import 'package:grove_front/ui/shared/web_wrapper.dart';
import 'package:grove_front/ui/shared/cards.dart';
import 'package:grove_front/core/models/data_models/issue.dart';
import 'package:grove_front/core/providers/issue_provider.dart';
import 'package:provider/provider.dart';
import 'package:grove_front/core/models/page_models/issue_page_model.dart';

class LandingView extends StatefulWidget {
  @override
  State createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  bool isLoading = false;
  //add needed data models here: List<MessageModel> messageList;
  late Issue issue;

  //add needed data providers here: MessageProvider messageProvider = new MessageProvider();
  IssueProvider issueProvider = new IssueProvider();

  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    // add method to fetch here: messageList = await messageProvider.fetchPosts();
    issue = await issueProvider.getIssueById(1);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return WebScreen(Center(
        child: isLoading
            ? CircularProgressIndicator()
            :

            //add code here
            Column(
                children: [
                  Card2(
                    issueId: 5,
                    issueName: issue.name,
                    issueSummary: issue.summary,
                    issueTotalVotes: issue.totalVotes,
                  ),
                  IssueCard(
                    issueId: 5,
                    issueName: issue.name,
                    issueSummary: issue.summary,
                    issueTotalVotes: issue.totalVotes,
                  ),
                  ChangeNotifierProvider(
                      create: (context) => IssuePageModel(),
                      child: ViewpointCard(
                          viewpointTitle: "Hi",
                          viewpointText: "Hi",
                          viewpointId: 1))
                ],
              )));
  }
}
