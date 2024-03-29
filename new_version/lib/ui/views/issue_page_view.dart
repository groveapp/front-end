import 'package:flutter/material.dart';
import 'package:grove_front_new/core/providers/viewpoint_provider.dart';
import 'package:grove_front_new/core/services/api_helper.dart';
import 'package:grove_front_new/ui/shared/buttons.dart';
import 'package:grove_front_new/ui/shared/charts.dart';
import 'package:grove_front_new/ui/shared/web_wrapper.dart';
import 'package:grove_front_new/ui/shared/cards.dart';
import 'package:grove_front_new/core/models/data_models/issue.dart';
import 'package:grove_front_new/core/models/data_models/viewpoint.dart';
import 'package:grove_front_new/core/providers/issue_provider.dart';
import 'package:provider/provider.dart';
import 'package:grove_front_new/core/models/page_models/issue_page_model.dart';
import 'package:grove_front_new/ui/shared/typography.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

// Define Issue Pages.

// note: change Share at bottom

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
    var isMobile = 0;
    // Check if mobile, to be used for determining share buttons.
    if ((defaultTargetPlatform == TargetPlatform.iOS) ||
        (defaultTargetPlatform == TargetPlatform.android)) {
      isMobile = 1;
    }

    return WebScreen(Center(
        child:
            // loading circle
            isLoading
                ? CircularProgressIndicator()
                :
                // This is where the actual UI code is defined.
                Column(children: [
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 4),
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
                                shareIssue(isMobile)
                              ],
                            )
                          ],
                        )),

                    //summary
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      alignment: Alignment.topCenter,
                      child: BodyPlain(text: issue.summary),
                    ),
                    // SizedBox(
                    //   width: 200,
                    //   height: 400,
                    //   child: DefaultTabController(
                    //       length: 1,
                    //       child: Column(
                    //         children: [
                    //           TabBar(
                    //             tabs: [Tab(text: "Vote"), Tab(text: "Statistics")],
                    //           ),
                    //           TabBarView(
                    //             children: [
                    getViewpointList(viewpoints),
                    // getDataView(viewpoints),
                    // ],
                    // )
                    // ],
                    // )),
                    // ),

                    BodyPlain(
                        text:
                            "Don't agree with any of the above viewpoints? Add your own:"),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: PrimaryButton(
                            text: "Submit another viewpoint",
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) =>
                                      SubmitViewpointDialog(issue: issue));
                            }))
                  ])));
  }
}

// Dialog used for submitting viewpoints.

class SubmitViewpointDialog extends StatefulWidget {
  final Issue issue;
  SubmitViewpointDialog({required this.issue});

  @override
  State createState() => _SubmitViewpointDialogState();
}

class _SubmitViewpointDialogState extends State<SubmitViewpointDialog> {
  ViewpointProvider viewpointProvider = new ViewpointProvider();
  final _dialogScrollController = ScrollController();
  final TextEditingController viewpointTitleController =
      new TextEditingController();
  final TextEditingController viewpointBodyController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Head2Bold(text: "Submit another Viewpoint"),
        content: Scrollbar(
          isAlwaysShown: true,
          interactive: true,
          controller: _dialogScrollController,
          child: SingleChildScrollView(
              controller: _dialogScrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Head3Plain(text: "Issue: ${widget.issue.name}"),
                    BodyPlain(
                        text:
                            "Give your viewpoint a title. Follow the guidelines below:"),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                        child: TextField(
                          style: TextStyle(fontFamily: "Open Sans"),
                          controller: viewpointTitleController,
                        )),
                    BodyPlain(
                        text:
                            "Now for the actual viewpoint. What do you think, and why? Follow the guidelines below:"),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                        child: TextField(
                          style: TextStyle(fontFamily: "Open Sans"),
                          // change reqs
                          maxLines: 5,
                          maxLength: 400,
                          controller: viewpointBodyController,
                        )),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrimaryButton(
                              text: "Cancel",
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          PrimaryButton(
                              text: "Submit Viewpoint",
                              onPressed: () async {
                                final response = await viewpointProvider
                                    .postViewpoint(Viewpoint(
                                        text: viewpointBodyController.text,
                                        issueId: widget.issue.id,
                                        upvotes: 1));
                                //Navigator.pop(context);
                                if (response != "error") {
                                  showDialog(
                                      context: context,
                                      builder: (_) =>
                                          ViewpointSubmittedDialog());
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => ViewpointErrorDialog());
                                }
                              })
                        ])
                  ])),
        ));
  }
}

// Widget getDataView(viewpoints) {
//   return SizedBox(
//       height: 200,
//       width: 400,
//       child: ViewpointApprovalChart(viewpointList: viewpoints));
// }

// Getting viewpoint list (to be used when IssuePage is separated into tabs)

Widget getViewpointList(viewpoints) {
  return SizedBox(
      width: 400,
      height: 200,
      child: ListView.builder(
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
          }));
}

// Share issue page.

Widget shareIssue(isMobile) {
  if (isMobile == 1) {
    return Container(
        child: PrimaryButton(
            text: "Share",
            onPressed: () {
              shareNative(html.window.location.href);
            }));
  } else {
    return Container(
        child: Row(children: [
      PrimaryButton(text: "FB Button", onPressed: () {}),
      PrimaryButton(text: "Tweet Button", onPressed: () {}),
      PrimaryButton(text: "Email Button", onPressed: () {})
    ]));
  }
}

Widget shareViewpoint(isMobile) {
  if (isMobile == 1) {
    return Container(
        child: PrimaryButton(
            text: "Share",
            onPressed: () {
              shareNative(html.window.location.href);
            }));
  } else {
    return Container(
        child: Row(children: [
      PrimaryButton(text: "FB Button", onPressed: () {}),
      PrimaryButton(text: "Tweet Button", onPressed: () {}),
      PrimaryButton(text: "Email Button", onPressed: () {})
    ]));
  }
}

// Share issue page (if mobile)

void shareNative(payload) async {
  await Share.share("Hello", subject: payload);
}

// Dialog to display once viewpoint has been submitted.

class ViewpointSubmittedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Head3Plain(text: "Viewpoint submitted successfully!"),
      content: Column(
        children: [
          BodyPlain(
              text:
                  "Thanks for sharing your view--you've made American democracy better today. Your viewpoint will be reviewed by our panel of moderators to make sure it fits our community guidelines, and will be added to this issue page once it's approved. We'll send you a confirmation email when that happens, so you can start sharing it with your friends.")
        ],
      ),
    );
  }
}

class ViewpointErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Head3Plain(text: "Viewpoint submitted successfully!"),
      content: Column(
        children: [
          BodyPlain(
              text:
                  "Thanks for sharing your view--you've made American democracy better today. Your viewpoint will be reviewed by our panel of moderators to make sure it fits our community guidelines, and will be added to this issue page once it's approved. We'll send you a confirmation email when that happens, so you can start sharing it with your friends.")
        ],
      ),
    );
  }
}
