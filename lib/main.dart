// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_learn_full/product/global/resource_context.dart';
import 'package:flutter_learn_full/product/global/theme_notifier.dart';
import '303/reqres_resource/view/reqres_view.dart';
// import '202/service/service_learn_get_view.dart';
// import '202/service/service_post_learn_view.dart';
// import '202/service/service_learn_view.dart';
// import '202/model_view_learn.dart';
// import '202/tab_learn.dart';
// import '101/button_learn.dart';
// import '101/scaffold_learn.dart';
// import '101/container_sized_box_learn.dart';
// import '101/text_view_learn.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => ResourceContext()), // Sadece data tutacak
      // Ekrana haber verilecekse ChangeNotifierProvider kullanılır
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
    // return CupertinoApp(                      // IOS görünüm için
    //   title: 'Flutter Demo',
    //   home: TextViewLearn(),
    // );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifier>().currentTheme,
      //  ThemeData.dark().copyWith(
      //     tabBarTheme: const TabBarTheme(
      //       labelColor: Colors.white,
      //       unselectedLabelColor: Colors.red,
      //       indicatorSize: TabBarIndicatorSize.label,
      //     ),
      //     bottomAppBarTheme: const BottomAppBarTheme(
      //       shape: CircularNotchedRectangle(),
      //     )),
      home: const ReqresView(),
    );
  }
}
