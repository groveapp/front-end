//import 'package:accountability/screens/empty.dart/issue_page_skeleton.dart';
import 'package:accountability/screens/my_followed_pages_screen.dart';
import 'package:accountability/screens/my_organizations_screen.dart';
import 'package:accountability/screens/profile_screen.dart';
import 'package:accountability/screens/screen_builder.dart';
import 'package:accountability/web_app/web_screens/home_screen_web.dart';
import 'package:accountability/web_app/web_screens/web_screen_test.dart';

import 'screens/dashboard_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/browse_issues_screen.dart';
import 'screens/browse_politicians_screen.dart';
import 'screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'screens/my_leaders_screen.dart';

import 'package:accountability/util/screen_list.dart';

const String HomeScreenRoute = '/';
const String ProfileScreenRoute = '/profile';
const String DashboardScreenRoute = '/dashboard';
const String BrowseIssuesScreenRoute = '/browse_issues';
const String BrowsePoliticiansScreenRoute = '/browse_politicians';
const String SearchPageRoute = '/search';
const String IssueScreenRoute = '/issues';
const String MyLeadersScreenRoute = '/my_politicians';
const String MyOrganizationsScreenRoute = '/my_organizations';
const String MyFollowedPagesScreenRoute = '/my_followed_pages';
const String ScreenBuilderRoute = '/screen_builder';

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
      return ExMaterialPageRoute(
          builder: (context) => HomeScreen(), settings: settings);
    case DashboardScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TestScreen(
                selectedPage: 0,
              ),
          settings: settings);
    case ProfileScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => Screen(), settings: settings);
    case BrowseIssuesScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => BrowseIssuesScreen(), settings: settings);
    case BrowsePoliticiansScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => //BrowsePoliticiansScreen()
              TestScreen(),
          settings: settings);
    case SearchPageRoute:
      return ExMaterialPageRoute(
          builder: (context) => SearchScreen(), settings: settings);
    case IssueScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => IssueScreen(), settings: settings);
    case MyLeadersScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TestScreen(selectedPage: 2),
          settings: settings);
    case MyOrganizationsScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TestScreen(
                selectedPage: 1,
              ),
          settings: settings);
    case MyFollowedPagesScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TestScreen(
                selectedPage: 3,
              ),
          settings: settings);
    case ScreenBuilderRoute:
      return ExMaterialPageRoute(
          builder: (context) => Screen(), settings: settings);
    default:
      return ExMaterialPageRoute(
          builder: (context) => HomeScreen(), settings: settings);
  }
}
