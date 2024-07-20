import 'package:flutter/material.dart';

import 'core/router/router.dart';
import 'features/main/presentation/pages/base.dart';
import 'features/onboarding/presentation/pages/onboarding.dart';

const String routeHome = '/home';

class Main extends StatelessWidget {
  ///constructor for the main class
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    const bool signed = false;
    return MaterialApp(
      title: 'SYI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        textTheme: const TextTheme(
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
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: Stack(
        children: <Widget>[
          const Navigator(
            onGenerateRoute: AppRouter.onGenerateRoute,
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Image.asset(
                'assets/grain.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
