import 'screens/dashboard_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/browse_issues_screen.dart';
import 'screens/browse_politicians_screen.dart';
import 'screens/search_screen.dart';
import 'package:flutter/material.dart';

const String HomeScreenRoute = '/';
const String ProfileScreenRoute = 'profile';
const String DashboardScreenRoute = 'dashboard';
const String BrowseIssuesScreenRoute = 'browse_issues';
const String BrowsePoliticiansScreenRoute = 'browse_politicians';
const String SearchPageRoute = 'search';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case DashboardScreenRoute:
      return MaterialPageRoute(builder: (context) => DashboardScreen());
    case ProfileScreenRoute:
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case BrowseIssuesScreenRoute:
      return MaterialPageRoute(builder: (context) => BrowseIssuesScreen());
    case BrowsePoliticiansScreenRoute:
      return MaterialPageRoute(builder: (context) => BrowsePoliticiansScreen());
    case SearchPageRoute:
      return MaterialPageRoute(builder: (context) => SearchScreen());
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
