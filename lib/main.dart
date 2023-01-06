// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '202/service/service_post_learn_view.dart';
// import '202/service/service_learn_view.dart';
// import '202/model_view_learn.dart';
// import '202/tab_learn.dart';
// import '101/button_learn.dart';
// import '101/scaffold_learn.dart';
// import '101/container_sized_box_learn.dart';
// import '101/text_view_learn.dart';

void main() {
  runApp(const MyApp());
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
      theme: ThemeData.dark().copyWith(
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            shape: CircularNotchedRectangle(),
          )),
      home: const ServicePostLearn(),
    );
  }
}
