import 'package:accountability/ui/components/page_full_card.dart';
import 'package:accountability/ui/screens/browse_issues_screen.dart';
import 'package:accountability/ui/screens/browse_politicians_screen.dart';
import 'package:accountability/ui/screens/dashboard_screen.dart';
import 'package:accountability/ui/screens/error_screen.dart';
import 'package:accountability/ui/screens/home_screen.dart';
import 'package:accountability/ui/screens/my_followed_pages_screen.dart';
import 'package:accountability/ui/screens/my_leaders_screen.dart';
import 'package:accountability/ui/screens/my_organizations_screen.dart';
import 'package:accountability/ui/screens/profile_screen.dart';
import 'package:accountability/ui/screens/search_screen.dart';
import 'package:accountability/ui/screens/useless/screen_builder.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:accountability/ui/web_app/web_screen_builder.dart';
import 'package:accountability/ui/components/screen_components/tab_bar_web.dart';
import 'package:flutter/material.dart';
import '../logic/internal_classes/data_structures.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(HomeScreenBody());
  }
}

class BrowseIssuesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(BrowseIssuesScreenBody());
  }
}

class BrowsePoliticiansScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(BrowsePoliticiansScreenBody());
  }
}

class ErrorScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(ErrorScreenBody());
  }
}

class SearchScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(SearchScreenBody());
  }
}

class TabBarScreen extends StatelessWidget {
  final int selectedPage;
  TabBarScreen({this.selectedPage = 0});
  Widget build(BuildContext context) {
    return WebScreen(TabBarScreenBody(
      selectedPage: selectedPage,
    ));
  }
}

class MyFollowedPagesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(MyFollowedPagesScreenBody());
  }
}

class MyLeadersScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(MyLeadersScreenBody());
  }
}

class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(ProfileScreenBody());
  }
}

class MyOrganizationsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(MyOrganizationsScreenBody());
  }
}

class DashboardScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(DashboardScreenBody());
  }
}

class Screen extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScreenBody();
  }
}

class IssueScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(FullCard('003'));
  }
}

class OrganizationScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(FullCard('001'));
  }
}

class LeaderScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(FullCard('sampleLeader'));
  }
}

class PageScreen extends StatelessWidget {
  //final PageID pageID;
  final String pageID;
  PageScreen(this.pageID);
  Widget build(BuildContext context) {
    return WebScreen(FullCard(pageID));
  }
}
