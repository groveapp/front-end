import 'package:flutter/material.dart';
import 'package:grove_front_new/core/models/data_models/routing_data.dart';
import 'package:grove_front_new/ui/views/about_view.dart';
import 'package:grove_front_new/ui/views/issue_list_view.dart';
import 'package:grove_front_new/ui/views/issue_page_view.dart';
import 'package:grove_front_new/ui/views/landing_view.dart';
import 'package:grove_front_new/ui/views/leader_view.dart';
import 'package:grove_front_new/ui/views/organization_list_view.dart';
import 'package:grove_front_new/core/services/string_extension.dart';

const String LandingRoute = '/';

// list screens: header, list, footer
const String OrganizationListRoute = '/organizations';
const String IssueListRoute = '/issues';
const String IssuePageRoute = '/issue';

// other screens
const String LeaderRoute = '/leader';
const String AboutRoute = '/about';

Route<dynamic> generateRoute(RouteSettings settings) {
  RoutingData routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case LandingRoute:
      return ExMaterialPageRoute(
          builder: (context) => LandingView(), settings: settings);
    // case OrganizationListRoute:
    //   return ExMaterialPageRoute(
    //       builder: (context) => OrganizationListView(), settings: settings);
    // case IssueListRoute:
    //   return ExMaterialPageRoute(
    //       builder: (context) => IssueListView(), settings: settings);
    case IssuePageRoute:
      var id = int.tryParse(routingData['id']);
      return ExMaterialPageRoute(
          builder: (context) => IssuePage(id), settings: settings);
    // case LeaderRoute:
    //   return ExMaterialPageRoute(
    //       builder: (context) => LeaderView(), settings: settings);
    // case AboutRoute:
    //   return ExMaterialPageRoute(
    //       builder: (context) => AboutView(), settings: settings);
    default:
      return ExMaterialPageRoute(
          builder: (context) => LandingView(), settings: settings);
  }
}

class ExMaterialPageRoute<T> extends MaterialPageRoute<T> {
  ExMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
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
