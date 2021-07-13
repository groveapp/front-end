import 'package:flutter/material.dart';
import 'package:grove_front/ui/shared/typography.dart';
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
  late Issue issue; //GET RID OF THIS

  //add needed data providers here: MessageProvider messageProvider = new MessageProvider();
  IssueProvider issueProvider = new IssueProvider(); //GET RID OF THIS

  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    // add method to fetch here: messageList = await messageProvider.fetchPosts();
    issue = await issueProvider.getIssueById(1); //GET RID OF THIS
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
                  Head1Bold(text: "Welcome to Grove"),
                  Head3Plain(
                      text:
                          "A place where you can voice your opinions to your leaders"),
                  //Sign in/sign up
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                      height: 600,
                      child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('images/capitol.jpg'))),

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
