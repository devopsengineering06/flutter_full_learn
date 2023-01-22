import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '303/reqres_resource/lottie_learn.dart';
import '404/bloc/feature/login/view/login_view.dart';
import 'product/constant/project_items.dart';
import 'product/global/resource_context.dart';
import 'product/global/theme_notifier.dart';
import 'product/navigator/navigator_custom.dart';
import 'product/navigator/navigator_manager.dart';

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

      // Cihaz üzerinde yapılan text değişiklikleri vb den uygulama etkilenmez
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? const SizedBox(),
        );
      },

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
      home: const LoginView(),
      // home: const LottieLearn(),
    );
  }
}
