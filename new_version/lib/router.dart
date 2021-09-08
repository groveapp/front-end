import 'package:flutter/material.dart';
import 'package:grove_front_new/core/models/data_models/routing_data.dart';
import 'package:grove_front_new/ui/views/about_view.dart';
import 'package:grove_front_new/ui/views/issue_list_view.dart';
import 'package:grove_front_new/ui/views/issue_page_view.dart';
import 'package:grove_front_new/ui/views/landing_view.dart';
import 'package:grove_front_new/ui/views/leader_view.dart';
import 'package:grove_front_new/ui/views/organization_list_view.dart';
import 'package:grove_front_new/core/services/string_extension.dart';
import 'package:beamer/beamer.dart';

// This project uses Beamer for URL routing. Routes are defined in a dictionary.
// See the labeled example below.

final beamerDelegate = BeamerDelegate(
  locationBuilder: SimpleLocationBuilder(
    routes: {
      '/': (context, state) =>
          BeamPage(title: 'Welcome to Grove', child: LandingView()),
      '/organizations': (context, state) {
        return BeamPage(
            title: 'Organizations in Grove',
            type: BeamPageType.fadeTransition,
            child: IssueListView());
      },

      // EXAMPLE

      // The string below is the URL that will be seen in the browser.
      // Everything after the colon in the string is a variable path parameter.
      '/organizations/:organizationId': (context, state) {
        // Retrieve the parameters of interest from the URL
        final organizationId =
            int.parse(state.pathParameters['organizationId']!);
        // Return a Widget or wrap it in a BeamPage for more flexibility
        return BeamPage(
            // Page title, seen in browser tab.
            title: 'Organization: $organizationId',
            // Page transition
            type: BeamPageType.fadeTransition,
            // Child Widget, with path parameters inserted.
            child: IssueListView(organizationId: organizationId));
      },

      '/issues/:issueId': (context, state) {
        final issueId = int.parse(state.pathParameters['issueId']!);
        return BeamPage(
            title: 'Issue: $issueId',
            type: BeamPageType.fadeTransition,
            child: IssuePage(issueId));
      },
      '/leaders/:leaderId': (context, state) {
        final leaderId = int.parse(state.pathParameters['leaderId']!);
        return BeamPage(
            title: 'Leader: $leaderId',
            type: BeamPageType.fadeTransition,
            child: LeaderPage(leaderId));
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
