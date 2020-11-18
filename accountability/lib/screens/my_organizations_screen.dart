import 'package:accountability/styles.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:accountability/components/screen_components/app_bar.dart';
import 'package:accountability/components/screen_components/left_drawer.dart';

class MyOrganizationsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Dashboard", context, _drawerKey),
      body: _buildBody(screenWidth, screenHeight),
      drawer: buildDrawers(context),
    );
  }
}

Widget _buildBody(screenWidth, screenHeight) {
  var numColumns = screenWidth ~/ (400 + 32);
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text("My Organizations", style: title2())),
          Expanded(
            child: GridView.count(
                childAspectRatio: 3 / 2,
                crossAxisCount: numColumns,
                mainAxisSpacing: 0,
                children: [
                  _myOrganizations(sampleOrganization),
                  _myOrganizations(sampleOrganization),
                  _myOrganizations(sampleOrganization),
                  _myOrganizations(sampleOrganization),
                  _myOrganizations(sampleOrganization),
                  Container(
                      height: 400,
                      width: 400,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: TextButton(
                          child: Text("Join More Organizations"),
                          onPressed: () {}))
                ]),
          )
        ],
      ));
}

Widget _myOrganizations(organization) {
  return Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: SizedBox(
                height: 400,
                width: 400,
                child: Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/barack-obama-main.jpg',
                        width: 400, height: 200, fit: BoxFit.cover),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                      "${organization.name}",
                                      style: title3(),
                                    ),
                                    SelectableText(
                                        "${organization.organizationArea}",
                                        style: subtitle1()),
                                    SelectableText(
                                        "${organization.numMembers} Members",
                                        style: subtitle1())
                                  ]),
                            ),
                          ),
                          // Container(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical: 16, horizontal: 8),
                          //     child: Column(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceEvenly,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           SelectableText(
                          //               "${leader.approvals} Approvals",
                          //               style: TextStyle(
                          //                   fontSize: 14, color: Colors.grey)),
                          //           SelectableText(
                          //               "${leader.disapprovals} Disapprovals",
                          //               style: TextStyle(
                          //                   fontSize: 14, color: Colors.grey)),
                          //           SelectableText(
                          //               "${leader.estimatedApprovalRating}% Estimated Approval",
                          //               style: TextStyle(
                          //                   fontSize: 14, color: Colors.grey))
                          //         ])),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: Row(children: [
                                IconButton(
                                    icon: Icon(Icons.message_rounded, size: 24),
                                    color: Colors.deepPurple,
                                    onPressed: () {}),
                              ]))
                        ]),
                    TextButton(
                        child:
                            Text("More Info", style: TextStyle(fontSize: 16)),
                        onPressed: () {}),
                  ],
                )),
              )))
      //)
      ;
}
