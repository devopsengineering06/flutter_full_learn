import 'package:flutter/material.dart';

import '101/text_view_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(primarySwatch: Colors.red),
      theme: ThemeData.dark(),
      home: TextViewLearn(),
    );
  }
}
