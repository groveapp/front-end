import 'package:accountability/screens/issue_page_skeleton.dart';
import 'package:accountability/screens/my_organizations_screen.dart';
import 'package:accountability/screens/profile_screen.dart';

import 'screens/dashboard_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/browse_issues_screen.dart';
import 'screens/browse_politicians_screen.dart';
import 'screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'screens/my_politicians_screen.dart';

const String HomeScreenRoute = '/';
const String ProfileScreenRoute = '/profile';
const String DashboardScreenRoute = '/dashboard';
const String BrowseIssuesScreenRoute = '/browse_issues';
const String BrowsePoliticiansScreenRoute = '/browse_politicians';
const String SearchPageRoute = '/search';
const String IssueScreenRoute = '/issues';
const String MyPoliticiansScreenRoute = '/my_politicians';
const String MyOrganizationsScreenRoute = '/my_organizations';

class ExMaterialPageRoute<T> extends MaterialPageRoute<T> {
  ExMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreenRoute:
      return ExMaterialPageRoute(builder: (context) => HomeScreen());
    case DashboardScreenRoute:
      return ExMaterialPageRoute(builder: (context) => DashboardScreen());
    case ProfileScreenRoute:
      return ExMaterialPageRoute(builder: (context) => ProfileScreen());
    case BrowseIssuesScreenRoute:
      return ExMaterialPageRoute(builder: (context) => BrowseIssuesScreen());
    case BrowsePoliticiansScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => BrowsePoliticiansScreen());
    case SearchPageRoute:
      return ExMaterialPageRoute(builder: (context) => SearchScreen());
    case IssueScreenRoute:
      return ExMaterialPageRoute(builder: (context) => IssueScreen());
    case MyPoliticiansScreenRoute:
      return ExMaterialPageRoute(builder: (context) => MyPoliticiansScreen());
    case MyOrganizationsScreenRoute:
      return ExMaterialPageRoute(builder: (context) => MyOrganizationsScreen());
    default:
      return ExMaterialPageRoute(builder: (context) => HomeScreen());
  }
}
