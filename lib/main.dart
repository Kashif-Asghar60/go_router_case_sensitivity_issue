import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authcontroller.dart';
import 'custom_route_parser.dart';
import 'routes.dart';
import 'screens.dart'; // Import the GoRouter setup

void main() {
    Get.put(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final CustomRouteInformationParser _customRouteInformationParser =
      CustomRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Flutter Web Navigation',
      // Use GoRouter for navigation
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      // No GetPages needed as GoRouter handles all navigation
    );
  }
}


class CustomRouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) async {
    // Normalize the path to lowercase
    final uri = Uri.parse(routeInformation.location ?? '/');
    final normalizedPath = uri.path.toLowerCase();
    return uri.replace(path: normalizedPath);
  }

  @override
  RouteInformation restoreRouteInformation(Uri configuration) {
    return RouteInformation(location: configuration.toString());
  }
}
 
/* 
class MyApp extends StatelessWidget {
  final CustomRouteInformationParser routeInformationParser = CustomRouteInformationParser();
  final CustomRouterDelegate routerDelegate = CustomRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Flutter Web Navigation',
      routeInformationParser: routeInformationParser,
      routerDelegate: routerDelegate,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return HomePage(routerDelegate: routerDelegate);
      },
    );
  }
}
 */