import 'package:flutter/cupertino.dart';
import 'navigator_routes.dart';

class NavigatorManager {
  NavigatorManager._();   // Singleton yapmak. Herkes kullanamaz.Bir örnek.
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavigateRoutes route, {Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushNamed(route.withParaf, arguments: arguments);
  }
}
