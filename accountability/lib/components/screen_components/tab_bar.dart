import 'package:accountability/screens/my_followed_pages_screen.dart';
import 'package:accountability/screens/my_organizations_screen.dart';
import 'package:accountability/screens/profile_screen.dart';
import 'package:accountability/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:accountability/screens/my_leaders_screen.dart';

class TabBarScreen extends StatefulWidget {
  @override
  State createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Center(
            child: Expanded(
                child: DefaultTabController(
                    length: 5,
                    child: Column(children: [
                      Container(
                        height: 50,
                        child: Theme(
                            data: ThemeData(
                                tabBarTheme: TabBarTheme(
                                    labelColor: Colors.blue,
                                    unselectedLabelColor: Colors.lightBlue)),
                            child: TabBar(tabs: [
                              Tab(
                                text: "Dashboard",
                                //icon: Icon(Icons.dashboard),
                              ),
                              Tab(
                                text: "My Organizations",
                                //icon: Icon(Icons.business_center)
                              ),
                              Tab(
                                text: "My Leaders", //icon: Icon(Icons.people)
                              ),
                              Tab(
                                text: "Followed Pages",
                                //: Icon(Icons.star)
                              ),
                              //Tab(text: "Messages"),
                              Tab(
                                text: "My Profile", //icon: Icon(Icons.person)
                              )
                            ])),
                      ),
                      Expanded(
                          child: TabBarView(children: [
                        DashboardScreen(), MyOrganizationsScreen(),
                        MyLeadersScreen(), MyFollowedPagesScreen(),
                        //MessagesScreen(),
                        ProfileScreen(),
                      ]))
                    ])))));
  }
}
