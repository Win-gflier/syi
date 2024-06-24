import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'app.dart';

Future<void> main() async {
  runApp(MyApp());
}

///My app class
class MyApp extends StatelessWidget {
  ///constructor
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Main();
  }
}
