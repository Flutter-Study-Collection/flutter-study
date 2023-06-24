import 'package:flutter/widgets.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  List<String?> routeHistory = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    routeHistory.add(route.settings.name);  // Add the new route to the history

    print('Navigated to ${route.settings.name}');
    print(':::Route stack: $routeHistory');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    routeHistory.removeLast();  // Remove the popped route from the history

    print('Navigated back to ${previousRoute?.settings.name}');
    print(':::Route stack: $routeHistory');
  }
}