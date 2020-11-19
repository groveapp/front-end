import 'package:flutter/material.dart';
import 'package:accountability/components/screen_components/app_bar.dart';
import 'package:accountability/components/screen_components/left_drawer.dart';
import 'package:accountability/styles.dart';
import 'dart:io';
import 'package:accountability/routes.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State createState() => new _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget build(BuildContext context) {
    Key _drawerKey = new GlobalKey();

    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return Scaffold(
      key: _drawerKey,
      appBar: buildAppBar("Dashboard", context, _drawerKey),
      body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: _buildColumns(context)),
      drawer: buildDrawers(context),
    );
  }
}

Widget _buildColumns(context) {
  return Center(
      child: Row(children: [
    Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("New Activity", style: title2(), textAlign: TextAlign.left),
            Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("45 New Issues", style: subtitle1()),
                      Text("96 Followed Page Notifications",
                          style: subtitle1()),
                      Text("34 New Leader Actions", style: subtitle1())
                    ]))
          ])),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Expanded(
            //     child: ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: 10,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //               title: Text("New Issue X"),
            //               tileColor: Colors.grey[300],
            //               hoverColor: Colors.grey[500]);
            //         })

            child: ListView(shrinkWrap: true, children: [
              ListTile(
                  title: Text("New Issue X"),
                  tileColor: Colors.grey[300],
                  hoverColor: Colors.blue[500]),
              ListTile(
                  title: Text("New Majority on Issue Y"),
                  tileColor: Colors.grey[300],
                  hoverColor: Colors.grey[500]),
              ListTile(
                  title: Text("Mayor Brown endorsed Viewpoint 3 on Issue Z"),
                  tileColor: Colors.grey[300],
                  hoverColor: Colors.grey[500]),
              ListTile(
                  title: Text("New Issue X"),
                  tileColor: Colors.grey[300],
                  hoverColor: Colors.grey[500]),
              Theme(
                  data: ThemeData(hoverColor: Colors.grey[500]),
                  child: Card(
                    child: Container(
                        decoration: BoxDecoration(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Text("New Issue X")),
                  ))
            ]),
          )),
    ])),
    //),
    SingleChildScrollView(
      child: Container(
          width: 300,
          color: Colors.grey,
          child: Column(
            children: [
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Container(child: Text("My Leaders", style: title3())),
                      Container(
                          child: ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                      File('assets/barack-obama-main.jpg'))),
                              title: Text("Mr. Green"),
                              subtitle: Text("City of Los Angeles"),
                              onTap: () {}),
                          ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                      File('assets/barack-obama-main.jpg'))),
                              title: Text("Mr. Green"),
                              subtitle: Text("City of Los Angeles")),
                          Container(
                              child: TextButton(
                                  child: Text("View More"),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      MyLeadersScreenRoute,
                                    );
                                  }))
                        ],
                      ))
                    ],
                  )),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Container(
                          child: Text("My Organizations", style: title3())),
                      Container(
                          child: ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/54cb2a3b-6e2f-44da-88c6-7aa4700ae50e/air-vapormax-2020-fk-mens-shoe-kn9vwZ.jpg")

                                  //FileImage(File(
                                  //'assets/images/barack-obama-main.jpg'))
                                  ),
                              title: Text("Federal Government"),
                              subtitle: Text("United States of America")),
                          ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                      File('assets/barack-obama-main.jpg'))),
                              title: Text("Undergraduate Student Government"),
                              subtitle:
                                  Text("University of Southern California")),
                          Container(
                              child: TextButton(
                                  child: Text("View More"),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      MyOrganizationsScreenRoute,
                                    );
                                  }))
                        ],
                      ))
                    ],
                  )),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Container(child: Text("Followed Pages", style: title3())),
                      Container(
                          child: ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                      File('assets/barack-obama-main.jpg'))),
                              title: Text("Mr. Green"),
                              subtitle: Text("City of Los Angeles")),
                          ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                      File('assets/barack-obama-main.jpg'))),
                              title: Text("Mr. Green"),
                              subtitle: Text("City of Los Angeles")),
                          Container(
                              child: TextButton(
                                  child: Text("View More"),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      MyFollowedPagesScreenRoute,
                                    );
                                  }))
                        ],
                      ))
                    ],
                  )),
            ],
          )),
    )
  ]));
}

// Widget _buildColumns() {
//   return SingleChildScrollView(
//     child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
//         child: Center(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//                 SizedBox(
//                     width: 200,
//                     child: Card(
//                         color: Colors.grey,
//                         child: Column(children: [
//                           fillColumns("New Politician Activity")
//                         ]))),
//                 SizedBox(
//                     width: 200,
//                     child: Card(
//                         color: Colors.grey,
//                         child: Column(children: [fillColumns("New Issues")]))),
//                 SizedBox(
//                     width: 200,
//                     child: Card(
//                         color: Colors.grey,
//                         child: Column(
//                             children: [fillColumns("Followed Page Activity")])))
//               ]),
//               Column(
//                 children: [
//                   Card(
//                       color: Colors.grey,
//                       child: Column(
//                         children: [
//                           Text("My Politicians"),
//                           Text("Mr. Green"),
//                           Text("Dr. Blue")
//                         ],
//                       )),
//                   Card(
//                       color: Colors.grey,
//                       child: Column(children: [
//                         Text("My Organizations"),
//                         Text("Organization 1"),
//                         Text("Organization 2")
//                       ])),
//                 ],
//               )
//             ]))),
//   );
// }

// Widget fillColumns(String columnTitle) {
//   return Column(
//       children: [Text(columnTitle), SelectableText("New Majority in Issue X")]);
// }
