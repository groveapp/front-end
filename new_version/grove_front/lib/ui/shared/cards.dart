import "package:flutter/material.dart";
import 'package:grove_front/ui/shared/colors.dart';
import 'package:grove_front/ui/shared/typography.dart';
import 'package:grove_front/ui/shared/buttons.dart';
import 'package:grove_front/core/models/page_models/issue_page_model.dart';
import 'package:provider/provider.dart';
import 'package:beamer/beamer.dart';

Future<Text> getPageData(pageID) {
  return Future<Text>.delayed(Duration(seconds: 2), () {
    return Text("Hello");
  });
}

class IssueCard extends StatelessWidget {
  final issueId;
  final issueImage =
      'https://upload.wikimedia.org/wikipedia/commons/4/4f/US_Capitol_west_side.JPG';
  final issueName;
  final issueSummary;
  final issueTotalVotes;

  IssueCard(
      {required this.issueId,
      required this.issueName,
      required this.issueSummary,
      required this.issueTotalVotes});

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
            hoverColor: Colors.black12,
            onTap: () {
              // Navigator.pushNamed(context, IssuePageRoute, arguments: 1);
              Beamer.of(context).beamToNamed('/issues/1');
            },
            child: SizedBox(
                height: 250,
                child: Row(children: [
                  SizedBox(
                    width: 400,
                    child: Stack(
                      children: [
                        SizedBox(
                            width: 400,
                            height: 250,
                            child: Container(
                                child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: 'images/capitol.jpg',
                                    image: issueImage))),
                        Container(color: Colors.black.withOpacity(0.3)),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            alignment: Alignment.topCenter,
                            child: Head2PlainWhite(
                                //dynamic change by variable
                                text: issueName)),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Container(
                              constraints: BoxConstraints(maxWidth: 300),
                              child: BodyPlain(text: issueSummary)),
                          Expanded(
                              child: Row(children: [
                            BodyPlain(text: "$issueTotalVotes Votes")
                          ]))
                        ],
                      ))
                ]))));
  }
}

class Card2 extends StatelessWidget {
  final issueId;
  final issueImage =
      'https://upload.wikimedia.org/wikipedia/commons/4/4f/US_Capitol_west_side.JPG';
  final issueName;
  final issueSummary;
  final issueTotalVotes;

  Card2(
      {required this.issueId,
      required this.issueName,
      required this.issueSummary,
      required this.issueTotalVotes});

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
            hoverColor: Colors.black12,
            onTap: () {
              // Navigator.pushNamed(context, IssuePageRoute, arguments: 1);
              Beamer.of(context).beamToNamed('/issues/1');
            },
            child: SizedBox(
                height: 400,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          constraints: BoxConstraints(maxWidth: 200),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: Head3Plain(text: issueName)),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 8),
                                          child: BodyPlain(text: issueSummary)),
                                    ]),
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: BodyPlain(
                                        text: "$issueTotalVotes Votes"))
                              ])),
                      SizedBox(
                        width: 500,
                        child: Stack(
                          children: [
                            SizedBox(
                                width: 500,
                                height: 400,
                                child: Container(
                                    child: FadeInImage.assetNetwork(
                                        fit: BoxFit.cover,
                                        placeholder: 'images/capitol.jpg',
                                        image: issueImage))),
                            //Container(color: Colors.black.withOpacity(0.3)),
                          ],
                        ),
                      ),
                    ]))));
  }
}

class ViewpointCard extends StatefulWidget {
  final viewpointTitle;
  final viewpointText;
  final viewpointId;

  ViewpointCard(
      {required this.viewpointTitle,
      required this.viewpointText,
      required this.viewpointId});

  @override
  State createState() => _ViewpointCardState();
}

class _ViewpointCardState extends State<ViewpointCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IssuePageModel>(builder: (context, pageModel, child) {
      return InkWell(
          onTap: () {},
          hoverColor: Colors.black12,
          child: Container(
              color: pageModel.agreedViewpoints.contains(widget.viewpointId)
                  ? Colors.black12
                  : null,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Head3Plain(text: widget.viewpointTitle),
                            Container(
                                width: 100,
                                child: Divider(
                                  color: actionColor,
                                  thickness: 4,
                                ))
                          ]),
                      Container(
                          constraints: BoxConstraints(maxWidth: 800),
                          child: BodyPlain(text: widget.viewpointText)),
                      Row(children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                          child: PrimaryButton(
                              text: "Agree",
                              onPressed: () {
                                if (pageModel.agreedViewpoints
                                        .contains(widget.viewpointId) ==
                                    false) {
                                  pageModel.add(widget.viewpointId);
                                }
                                ;
                              }),
                        ),
                        PrimaryButton(
                            text: "Disagree",
                            onPressed: () {
                              pageModel.remove(widget.viewpointId);
                            })
                      ])
                    ],
                  ))));
    });
  }
}

class OrganizationCard extends StatelessWidget {
  final organizationId;
  final organizationImage =
      'https://upload.wikimedia.org/wikipedia/commons/4/4f/US_Capitol_west_side.JPG';
  final name;
  final area;

  OrganizationCard(
      {required this.organizationId, required this.name, required this.area});

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
            hoverColor: Colors.black12,
            onTap: () {
              // Navigator.pushNamed(context, IssuePageRoute, arguments: 1);
              Beamer.of(context).beamToNamed('/issues/1');
            },
            child: SizedBox(
                height: 250,
                child: Row(children: [
                  SizedBox(
                    width: 400,
                    child: Stack(
                      children: [
                        SizedBox(
                            width: 400,
                            height: 250,
                            child: Container(
                                child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: 'images/capitol.jpg',
                                    image: organizationImage))),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Container(
                              constraints: BoxConstraints(maxWidth: 300),
                              child: Head3Bold(text: name)),
                          Expanded(
                              child: Row(children: [BodyPlain(text: area)]))
                        ],
                      ))
                ]))));
  }
}
