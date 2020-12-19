import 'package:accountability/ui/screens/my_followed_pages_screen.dart';
import 'package:accountability/ui/screens/my_organizations_screen.dart';
import 'package:accountability/ui/screens/profile_screen.dart';
import 'package:accountability/ui/screens/dashboard_screen.dart';
// import 'package:accountability/ui/web_app/web_screens/dashboard_screen_web.dart';
import 'package:flutter/material.dart';
import 'package:accountability/ui/screens/my_leaders_screen.dart';

class TabBarScreenBody extends StatefulWidget {
  final int selectedPage;
  TabBarScreenBody({this.selectedPage = 0});
  @override
  State createState() => _TabBarScreenBodyState();
}

class _TabBarScreenBodyState extends State<TabBarScreenBody> {
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
                    initialIndex: widget.selectedPage,
                    length: 5,
                    child: Column(children: [
                      Container(
                        height: 50,
                        child: Theme(
                            data: ThemeData(
                                tabBarTheme: TabBarTheme(
                                    labelColor: Colors.blue,
                                    unselectedLabelColor: Colors.lightBlue)),
                            child: TabBar(
                                //isScrollable: true,

                                tabs: [
                                  Tab(
                                    text: "Dashboard",
                                    //icon: Icon(Icons.dashboard),
                                  ),
                                  Tab(
                                    text: "My Organizations",
                                    //icon: Icon(Icons.business_center)
                                  ),
                                  Tab(
                                    text:
                                        "My Leaders", //icon: Icon(Icons.people)
                                  ),
                                  Tab(
                                    text: "Followed Pages",
                                    //: Icon(Icons.star)
                                  ),
                                  //Tab(text: "Messages"),
                                  Tab(
                                    text:
                                        "My Profile", //icon: Icon(Icons.person)
                                  )
                                ])),
                      ),
                      Expanded(
                          child: TabBarView(children: [
                        DashboardScreenBody(), MyOrganizationsScreenBody(),
                        MyLeadersScreenBody(), MyFollowedPagesScreenBody(),
                        //MessagesScreen(),
                        ProfileScreenBody(),
                      ]))
                    ])))));
  }
}
