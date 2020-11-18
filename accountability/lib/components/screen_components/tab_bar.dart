import 'package:flutter/material.dart';

Widget buildTabBar() {
return TabBar(tabs: [
          Tab(text: "Dashboard"),
         Tab(text: "My Organizations"),
          Tab(text: "My Leaders"),
           Tab(text: "Followed Pages"),
            Tab(text: "Messages"),
             Tab(text: "My Profile")]),
        TabBarView(
        children: [DashboardScreen(), MyOrganizationsScreen(), MyLeadersScreen(), FollowedPagesScreen(), MessagesScreen(), ProfileScreen(), ])
;}