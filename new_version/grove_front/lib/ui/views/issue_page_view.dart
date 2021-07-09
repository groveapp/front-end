import 'package:flutter/material.dart';
import 'package:grove_front/core/providers/viewpoint_provider.dart';
import 'package:grove_front/ui/shared/buttons.dart';
import 'package:grove_front/ui/shared/web_wrapper.dart';
import 'package:grove_front/ui/shared/cards.dart';
import 'package:grove_front/core/models/data_models/issue.dart';
import 'package:grove_front/core/models/data_models/viewpoint.dart';
import 'package:grove_front/core/providers/issue_provider.dart';
import 'package:provider/provider.dart';
import 'package:grove_front/core/models/page_models/issue_page_model.dart';
import 'package:grove_front/ui/shared/typography.dart';

class IssuePage extends StatefulWidget {
  // accept passed arguments from nav here
  final issueId;
  IssuePage({this.issueId});

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
                              text: issue.name)),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          BodyPlain(
                              text:
                                  "${viewpoints.length} Viewpoints, ${issue.totalVotes} Votes")
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AltButton(text: "Follow", onPressed: () {}),
                            Container(width: 8),
                            PrimaryButton(text: "Share", onPressed: () {})
                          ],
                        )
                      ],
                    )),

                //summary
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  alignment: Alignment.topCenter,
                  child: BodyPlain(text: issue.summary),
                ),

                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: viewpoints.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider(
                          create: (context) => IssuePageModel(),
                          child: ViewpointCard(
                              viewpointTitle: viewpoints[index].id.toString(),
                              viewpointText: viewpoints[index].text,
                              viewpointId: viewpoints[index].id));
                    }),

                PrimaryButton(
                    text: "Submit another viewpoint",
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(

                              // add submit viewpoint dialog here

                              ));
                    })
              ])));
  }
}
