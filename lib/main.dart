import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '303/reqres_resource/lottie_learn.dart';
import '404/bloc/feature/login/view/login_view.dart';
import 'product/constant/project_items.dart';
import 'product/global/theme_notifier.dart';
import 'product/init/product_init.dart';
import 'product/navigator/navigator_custom.dart';
import 'product/navigator/navigator_manager.dart';

Future<void> main() async {
  final produtInit = ProductInit();
  await produtInit.init();
  runApp(
    EasyLocalization(
        supportedLocales: produtInit.localizationInit.supportedLocales,
        path: produtInit.localizationInit.localizationPath, // <-- change the path of the translation files
        child: MultiProvider(
          providers: produtInit.providers,
          builder: (context, child) => const MyApp(),
        )),
  );
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectName,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      // Cihaz üzerinde yapılan text değişiklikleri vb den uygulama etkilenmez
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? const SizedBox(),
        );
      },

      // initialRoute: '/',
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
