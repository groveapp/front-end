import 'package:flutter/material.dart';
import 'package:accountability/ui/screen_list.dart';
import 'package:accountability/string_extensions.dart';

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
const String PageScreenRoute = '/pages';
const String ErrorScreenRoute = '/error';

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
  var routingData = settings.name.getRoutingData;
  switch (routingData.route) {
    case HomeScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => HomeScreen(), settings: settings);
    case DashboardScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TabBarScreen(
                selectedPage: 0,
              ),
          settings: settings);
    case ProfileScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TabBarScreen(
                selectedPage: 3,
              ),
          settings: settings);
    case BrowseIssuesScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => BrowseIssuesScreen(), settings: settings);
    case BrowsePoliticiansScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => BrowsePoliticiansScreen(), settings: settings);
    case SearchPageRoute:
      return ExMaterialPageRoute(
          builder: (context) => SearchScreen(), settings: settings);
    case IssueScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => IssueScreen(), settings: settings);

    case PageScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => PageScreen(settings.arguments),
          settings: settings);
    case MyLeadersScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TabBarScreen(selectedPage: 2),
          settings: settings);
    case MyOrganizationsScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TabBarScreen(
                selectedPage: 1,
              ),
          settings: settings);
    case MyFollowedPagesScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => TabBarScreen(
                selectedPage: 3,
              ),
          settings: settings);
    case ScreenBuilderRoute:
      return ExMaterialPageRoute(
          builder: (context) => Screen(), settings: settings);
    case ErrorScreenRoute:
      return ExMaterialPageRoute(
          builder: (context) => ErrorScreen(), settings: settings);
    default:
      return ExMaterialPageRoute(
          builder: (context) => HomeScreen(), settings: settings);
  }
}
