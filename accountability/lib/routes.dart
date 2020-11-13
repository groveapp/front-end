import 'package:accountability/screens/issue_page_skeleton.dart';

import 'screens/dashboard_screen.dart';
import 'screens/home_screen.dart';
//import 'screens/profile_screen.dart';
import 'screens/browse_issues_screen.dart';
import 'screens/browse_politicians_screen.dart';
import 'screens/search_screen.dart';
import 'package:flutter/material.dart';
//import 'screens/issue_page_template.dart';
import 'screens/screen_template.dart';

const String HomeScreenRoute = '/';
const String ProfileScreenRoute = '/profile';
const String DashboardScreenRoute = '/dashboard';
const String BrowseIssuesScreenRoute = '/browse_issues';
const String BrowsePoliticiansScreenRoute = '/browse_politicians';
const String SearchPageRoute = '/search';
const String IssuePageTemplateRoute = '/issues';

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
      return ExMaterialPageRoute(builder: (context) => ViewpointCard());
    case BrowseIssuesScreenRoute:
      return ExMaterialPageRoute(builder: (context) => BrowseIssuesScreen());
    case BrowsePoliticiansScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => BrowsePoliticiansScreen());
    case SearchPageRoute:
      return ExMaterialPageRoute(builder: (context) => SearchScreen());
    case IssuePageTemplateRoute:
      return ExMaterialPageRoute(builder: (context) => IssueCard());
    default:
      return ExMaterialPageRoute(builder: (context) => HomeScreen());
  }
}
