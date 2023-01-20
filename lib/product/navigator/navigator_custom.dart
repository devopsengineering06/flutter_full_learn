import 'package:flutter/material.dart';

import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';
import '../../303/reqres_resource/lottie_learn.dart';
import '../../main.dart';
import 'navigator_routes.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateToNormal(const LottieLearn());
    }

    final routes = routeSettings.name == NavigatorRoutes.paragfh
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      case NavigateRoutes.init:
        return _navigateToNormal(const LottieLearn());
      case NavigateRoutes.home:
        return _navigateToNormal(const NavigateHomeView());
      case NavigateRoutes.detail:
        final id = routeSettings.arguments;
        return _navigateToNormal(
            NavigateHomeDetail(
              id: id is String ? id : null,
            ),
            isFullScreenDialog: true);
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child, {bool? isFullScreenDialog}) {
    return MaterialPageRoute(
        fullscreenDialog: isFullScreenDialog ?? false,
        builder: (context) {
          return child;
        });
  }
}
