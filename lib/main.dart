import 'package:flutter/material.dart';
import 'package:flutter_learn_full/303/reqres_resource/lottie_learn.dart';
import 'package:flutter_learn_full/product/constant/project_items.dart';
import 'package:flutter_learn_full/product/navigator/navigator_custom.dart';
import 'package:flutter_learn_full/product/navigator/navigator_manager.dart';
import 'package:flutter_learn_full/product/navigator/navigator_routes.dart';
import 'package:provider/provider.dart';

import 'package:flutter_learn_full/product/global/resource_context.dart';
import 'package:flutter_learn_full/product/global/theme_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<ResourceContext>(create: (_) => ResourceContext()),
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      ),
    ],
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectName,
      theme: context.watch<ThemeNotifier>().currentTheme,
      // home: const LottieLearn(),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const LottieLearn();
          },
        );
      },
      // routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
    );
  }
}
