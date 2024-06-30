import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syi/presentation/onboarding/onboarging_second.dart';
import 'package:syi/presentation/onboarding/onboarging_third.dart';

import 'presentation/onboarding/onboarging_first.dart';

class Main extends StatelessWidget {
  ///constructor for the main class
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SYI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          // fontFamily: 'LeagueGothic',
          textTheme:  const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontFamily: 'LeagueGothic',
            ),
            headlineMedium: TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontFamily: 'LeagueGothic',
            ),
            headlineSmall: TextStyle(
              fontSize: 24,
              color: Color(0xff232121),
              fontFamily: 'LeagueGothic',
            ),
          ),
          canvasColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        home: Stack(children: <Widget>[
          Navigator(
            onGenerateRoute: (RouteSettings settings) {
              WidgetBuilder builder;
              // Define the routes here
              switch (settings.name) {
                case '/':
                  builder = (BuildContext _) => const OnboardingFirst();
                case '/second':
                  builder = (BuildContext _) => const OnboardingSecond();
                case '/third':
                  builder = (BuildContext _) => const OnboardingThird();

                default:
                  throw Exception('Invalid route: ${settings.name}');
              }
              return MaterialPageRoute(builder: builder, settings: settings);
            },
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Image.asset(
                repeat: ImageRepeat.repeat,
                'assets/grain.png',
              ),
            ),
          ),
        ]));
  }
}
