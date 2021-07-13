import 'package:flutter/material.dart';
import 'package:grove_front/core/models/data_models/routing_data.dart';
import 'package:grove_front/ui/views/about_view.dart';
import 'package:grove_front/ui/views/issue_list_view.dart';
import 'package:grove_front/ui/views/issue_page_view.dart';
import 'package:grove_front/ui/views/landing_view.dart';
import 'package:grove_front/ui/views/leader_view.dart';
import 'package:grove_front/ui/views/organization_list_view.dart';
import 'package:grove_front/core/services/string_extension.dart';

const String LandingRoute = '/';

// list screens: header, list, footer
const String OrganizationListRoute = '/organizations';
const String IssueListRoute = '/issues';
const String IssuePageRoute = '/issue';

// other screens
const String LeaderRoute = '/leader';
const String AboutRoute = '/about';

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

Route<dynamic> generateRoute(RouteSettings settings) {
  RoutingData routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case LandingRoute:
      return _getPageRoute(LandingView(), settings);
    // case OrganizationListRoute:
    //   return ExMaterialPageRoute(
    //       builder: (context) => OrganizationListView(), settings: settings);
    // case IssueListRoute:
    //   return ExMaterialPageRoute(
    //       builder: (context) => IssueListView(), settings: settings);
    case IssuePageRoute:
      var id = settings.arguments ?? int.tryParse(routingData['id']);
      return (id != null)
          ? _getPageRoute(IssuePage(id), settings)
          : _getPageRoute(LandingView(), settings);

    // case LeaderRoute:
    //   return ExMaterialPageRoute(
    //       builder: (context) => LeaderView(), settings: settings);
    // case AboutRoute:
    //   return ExMaterialPageRoute(
    //       builder: (context) => AboutView(), settings: settings);
    default:
      return _getPageRoute(LandingView(), settings);
  }
}
