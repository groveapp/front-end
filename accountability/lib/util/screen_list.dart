import 'package:accountability/components/page_full_card.dart';
import 'package:accountability/screens/browse_issues_screen.dart';
import 'package:accountability/screens/browse_politicians_screen.dart';
import 'package:accountability/screens/dashboard_screen.dart';
import 'package:accountability/screens/error_screen.dart';
import 'package:accountability/screens/home_screen.dart';
import 'package:accountability/screens/my_followed_pages_screen.dart';
import 'package:accountability/screens/my_leaders_screen.dart';
import 'package:accountability/screens/my_organizations_screen.dart';
import 'package:accountability/screens/profile_screen.dart';
import 'package:accountability/screens/search_screen.dart';
import 'package:accountability/screens/useless/screen_builder.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:accountability/web_app/web_screen_builder.dart';
import 'package:accountability/components/screen_components/tab_bar_web.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return WebScreen(TabBarScreenBody());
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
    return WebScreen(FullCard(sampleIssue));
  }
}

class OrganizationScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(FullCard(sampleOrganization));
  }
}

class LeaderScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebScreen(FullCard(sampleLeader));
  }
}
