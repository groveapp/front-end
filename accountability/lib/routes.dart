import 'screens/dashboard_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreenRoute:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case DashboardScreenRoute:
      return MaterialPageRoute(builder: (context) => DashboardScreen());
    case ProfileScreenRoute:
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
