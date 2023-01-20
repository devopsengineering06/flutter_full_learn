import 'package:flutter/material.dart';
import 'package:flutter_learn_full/product/constant/project_items.dart';
import 'package:provider/provider.dart';

import '303/reqres_resource/lottie_learn.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectItems.projectName,
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: const LottieLearn(),
    );
  }
}
