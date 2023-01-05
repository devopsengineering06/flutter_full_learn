// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '101/container_sized_box_learn.dart';
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
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ContainerSizedBoxLearn(),
    );
  }
}
