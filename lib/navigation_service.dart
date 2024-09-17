import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static dynamic navigateTo(Widget route, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (ctx) => route));
  }

  static dynamic replaceScreen(Widget route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => route), (val) => false);
  }

  static dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}
