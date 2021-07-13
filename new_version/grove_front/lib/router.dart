import 'package:flutter/material.dart';
import 'package:grove_front/core/models/data_models/routing_data.dart';
import 'package:grove_front/ui/views/about_view.dart';
import 'package:grove_front/ui/views/issue_list_view.dart';
import 'package:grove_front/ui/views/issue_page_view.dart';
import 'package:grove_front/ui/views/landing_view.dart';
import 'package:grove_front/ui/views/leader_view.dart';
import 'package:grove_front/ui/views/organization_list_view.dart';
import 'package:grove_front/core/services/string_extension.dart';
import 'package:beamer/beamer.dart';

final beamerDelegate = BeamerDelegate(
  locationBuilder: SimpleLocationBuilder(
    routes: {
      // Return either Widgets or BeamPages if more customization is needed
      '/': (context, state) =>
          BeamPage(title: 'Welcome to Grove', child: LandingView()),
      '/organizations': (context, state) {
        // Take the parameter of interest from BeamState
        // Return a Widget or wrap it in a BeamPage for more flexibility
        return BeamPage(
            title: 'Organizations in Grove',
            type: BeamPageType.fadeTransition,
            child: IssueListView());
      },
      '/organizations/:organizationId': (context, state) {
        // Take the parameter of interest from BeamState
        final organizationId =
            int.parse(state.pathParameters['organizationId']!);
        // Return a Widget or wrap it in a BeamPage for more flexibility
        return BeamPage(
            title: 'Organization: $organizationId',
            type: BeamPageType.fadeTransition,
            child: IssueListView(organizationId: organizationId));
      },
      '/issues/:issueId': (context, state) {
        // Take the parameter of interest from BeamState
        final issueId = int.parse(state.pathParameters['issueId']!);
        // Return a Widget or wrap it in a BeamPage for more flexibility
        return BeamPage(
            title: 'Issue: $issueId',
            type: BeamPageType.fadeTransition,
            child: IssuePage(issueId));
      },
    },
  ),
);

// other routing options: https://medium.com/flutter-community/advance-url-navigation-for-flutter-web-d8b5f2d424e6
// or the one below


// const String LandingRoute = '/';

// // list screens: header, list, footer
// const String OrganizationListRoute = '/organizations';
// const String IssueListRoute = '/issues';
// const String IssuePageRoute = '/issue';

// // other screens
// const String LeaderRoute = '/leader';
// const String AboutRoute = '/about';

// Route<dynamic> generateRoute(RouteSettings settings) {
//   RoutingData routingData = settings.name!.getRoutingData;
//   switch (routingData.route) {
//     case LandingRoute:
//       return ExMaterialPageRoute(
//           builder: (context) => LandingView(), settings: settings);
//     // case OrganizationListRoute:
//     //   return ExMaterialPageRoute(
//     //       builder: (context) => OrganizationListView(), settings: settings);
//     // case IssueListRoute:
//     //   return ExMaterialPageRoute(
//     //       builder: (context) => IssueListView(), settings: settings);
//     case IssuePageRoute:
//       var id = int.tryParse(routingData['id']);
//       return ExMaterialPageRoute(
//           builder: (context) => IssuePage(issueId: id), settings: settings);
//     // case LeaderRoute:
//     //   return ExMaterialPageRoute(
//     //       builder: (context) => LeaderView(), settings: settings);
//     // case AboutRoute:
//     //   return ExMaterialPageRoute(
//     //       builder: (context) => AboutView(), settings: settings);
//     default:
//       return ExMaterialPageRoute(
//           builder: (context) => LandingView(), settings: settings);
//   }
// }

// class ExMaterialPageRoute<T> extends MaterialPageRoute<T> {
//   ExMaterialPageRoute({
//     required WidgetBuilder builder,
//     required RouteSettings settings,
//     bool maintainState = true,
//     bool fullscreenDialog = false,
//   }) : super(
//             builder: builder,
//             maintainState: maintainState,
//             settings: settings,
//             fullscreenDialog: fullscreenDialog);

//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     return child;
//   }
// }
