import 'package:flutter/material.dart';
import 'package:grove_front/core/providers/viewpoint_provider.dart';
import 'package:grove_front/ui/shared/buttons.dart';
import 'package:grove_front/ui/shared/web_wrapper.dart';
import 'package:grove_front/ui/shared/cards.dart';
import 'package:grove_front/core/models/data_models/leader.dart';
import 'package:grove_front/core/models/data_models/viewpoint.dart';
import 'package:grove_front/core/providers/leader_provider.dart';
import 'package:provider/provider.dart';
//import 'package:grove_front/core/models/page_models/leader_page_model.dart';
import 'package:grove_front/ui/shared/typography.dart';
import 'package:share_plus/share_plus.dart';

class LeaderPage extends StatefulWidget {
  // accept passed arguments from nav here
  final leaderId;
  LeaderPage({this.leaderId});

  @override
  State createState() => _LeaderPageState();
}

class _LeaderPageState extends State<LeaderPage> {
  bool isLoading = false;

  //add needed data models here: late List<MessageModel> messageList;
  late Leader leader;

  //add needed data providers here: MessageProvider messageProvider = new MessageProvider();
  LeaderProvider leaderProvider = new LeaderProvider();

  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    // add method to fetch here: messageList = await messageProvider.fetchPosts();
    leader = await leaderProvider.getLeaderById(widget.leaderId);
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
                  children: [
                    // SizedBox(height: 200, width: 100, child: FadeInImage.assetNetwork(
                    //                       fit: BoxFit.cover,
                    //                       placeholder: 'images/capitol.jpg',
                    //                       image: leader.image)),
                    Column(
                      children: [
                        Row(children: [
                          Head2Bold(text: leader.firstName)
                          //follow button and share button
                        ]),
                        // Head3Plain(text: leader.title),
                        BodyPlain(text: leader.bio)
                      ],
                    )
                  ],
                ),

                // divergence index
                // past votes
                // top contributors
                // campaign promises
              ])));
  }
}
