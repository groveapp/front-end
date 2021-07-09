import 'package:flutter/material.dart';
import 'package:grove_front/core/models/data_models/organization.dart';
import 'package:grove_front/core/providers/organization_provider.dart';
import 'package:grove_front/ui/shared/web_wrapper.dart';
import 'package:grove_front/ui/shared/cards.dart';
import 'package:grove_front/core/models/data_models/issue.dart';
import 'package:grove_front/core/providers/issue_provider.dart';
import 'package:provider/provider.dart';
import 'package:grove_front/ui/shared/typography.dart';

class IssueListView extends StatefulWidget {
  // accept passed arguments from nav here
  final organizationId;
  IssueListView({this.organizationId});

  @override
  State createState() => _IssueListViewState();
}

class _IssueListViewState extends State<IssueListView> {
  bool isLoading = false;

  //add needed data models here: late List<MessageModel> messageList;
  late List<Issue> issues;
  late Organization organization;

  //add needed data providers here: MessageProvider messageProvider = new MessageProvider();
  IssueProvider issueProvider = new IssueProvider();
  OrganizationProvider organizationProvider = new OrganizationProvider();

  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    // add method to fetch here: messageList = await messageProvider.fetchPosts();
    issues = await issueProvider.getIssuesByOrganization(widget.organizationId);
    organization =
        await organizationProvider.getOrganizationById(widget.organizationId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return WebScreen(Center(
        child: isLoading
            ? CircularProgressIndicator()
            :
            //add code here
            Column(children: [
                //photo
                SizedBox(
                  width: 800,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: 800,
                          height: 250,
                          child: Container(
                              child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: 'images/capitol.jpg',
                                  image:
                                      'https://upload.wikimedia.org/wikipedia/commons/4/4f/US_Capitol_west_side.JPG'))),
                      Container(color: Colors.black.withOpacity(0.3)),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          alignment: Alignment.topCenter,
                          child: Head2PlainWhite(
                              //dynamic change by variable
                              text: organization.name)),
                    ],
                  ),
                ),

                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: issues.length,
                    itemBuilder: (context, index) {
                      return Card2(
                          issueId: issues[index].id,
                          issueName: issues[index].name,
                          issueSummary: issues[index].summary,
                          issueTotalVotes: issues[index].totalVotes);
                    }),
              ])));
  }
}
