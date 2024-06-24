import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AuthPage.dart';

class Main extends StatelessWidget {
  ///constructor for the main class
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SYI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            canvasColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            )),
        home: const Scaffold(body: AuthPage()));
  }
}
