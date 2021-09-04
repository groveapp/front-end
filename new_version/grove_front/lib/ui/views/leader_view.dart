import 'package:flutter/material.dart';
import 'package:grove_front/core/mock_data.dart';
import 'package:grove_front/core/providers/viewpoint_provider.dart';
import 'package:grove_front/ui/shared/buttons.dart';
import 'package:grove_front/ui/shared/web_wrapper.dart';
import 'package:grove_front/ui/shared/cards.dart';
import 'package:grove_front/core/models/data_models/leader.dart';
import 'package:grove_front/core/models/data_models/viewpoint.dart';
import 'package:grove_front/core/providers/leader_provider.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:provider/provider.dart';
//import 'package:grove_front/core/models/page_models/leader_page_model.dart';
import 'package:grove_front/ui/shared/typography.dart';
import 'package:share_plus/share_plus.dart';

class LeaderPage extends StatefulWidget {
  final leaderId;
  LeaderPage(this.leaderId);

  @override
  State createState() => _LeaderPageState();
}

class _LeaderPageState extends State<LeaderPage> {
  bool isLoading = false;

  late Leader leader;

  LeaderProvider leaderProvider = new LeaderProvider();

  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    // add method to fetch here: messageList = await messageProvider.fetchPosts();
    //leader = await leaderProvider.getLeaderById(widget.leaderId);
    leader = testLeader;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 300,
                        width: 200,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'images/capitol.jpg',
                            image:
                                'https://upload.wikimedia.org/wikipedia/commons/4/4f/US_Capitol_west_side.JPG' //leader.image
                            )),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Head2Bold(
                                      text: leader.firstName +
                                          " " +
                                          leader.lastName),
                                  Container(width: 16),
                                  PrimaryButton(
                                      text: "Follow", onPressed: () {})
                                ])
                            //follow button and share button
                            ,
                            Container(height: 8),
                            // Head3Plain(text: leader.title),
                            SizedBox(
                                width: 500, child: BodyPlain(text: leader.bio))
                          ],
                        ))
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(
                          (255 - leader.estApproval * 255).toInt(),
                          (leader.estApproval * 255).toInt(),
                          0,
                          150),
                    ),
                    child: Tooltip(
                        message: "Here's how we calculate this",
                        child: SizedBox(
                            height: 100,
                            width: 400,
                            child: Center(
                                child: Head3Bold(
                                    text:
                                        "Divergence Index: ${leader.estApproval}"))))),
                // divergence index
                // past votes
                SizedBox(
                  height: 400,
                  width: 800,
                  //child: _buildDataTable(),
                ),

                SizedBox(
                  height: 400,
                  width: 800,
                  child: HorizontalDataTable(
                    leftHandSideColumnWidth: 100,
                    rightHandSideColumnWidth: 600,
                    isFixedHeader: true,
                    headerWidgets: [
                      BodyPlain(
                        text: "Left",
                      ),
                      BodyPlain(text: "Right")
                    ],
                    leftSideItemBuilder: (BuildContext context, int index) {
                      return BodyPlain(text: "5");
                    },
                    rightSideItemBuilder: (BuildContext context, int index) {
                      return BodyPlain(text: "10");
                    },
                    itemCount: 10,
                    rowSeparatorWidget: const Divider(
                      color: Colors.black54,
                      height: 1.0,
                      thickness: 0.0,
                    ),
                    leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                    rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                    verticalScrollbarStyle: const ScrollbarStyle(
                      thumbColor: Colors.yellow,
                      isAlwaysShown: true,
                      thickness: 4.0,
                      radius: Radius.circular(5.0),
                    ),
                    horizontalScrollbarStyle: const ScrollbarStyle(
                      thumbColor: Colors.red,
                      isAlwaysShown: true,
                      thickness: 4.0,
                      radius: Radius.circular(5.0),
                    ),
                  ),
                )

                // top contributors
                // campaign promises
              ])));
  }
}

// Widget _buildDataTable() {
//   return DataTable(
//     columns: [
//       DataColumn(),
//       DataColumn(),
//     ],
//     rows: 
//   )
// }

