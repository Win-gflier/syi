import 'package:flutter/material.dart';

import 'onboarding_first.dart';
import 'onboarding_second.dart';
import 'onboarding_third.dart';

const String routePrefixOnboarding = '/';
const String routePrefixOnboardingFirst = routePrefixOnboarding;
const String routePrefixOnboardingSecondPage = '$routePrefixOnboarding/second';
const String routePrefixOnboardingThirdPage = '$routePrefixOnboarding/third';

class Onboarding extends StatelessWidget {
  Onboarding({super.key, required this.setupPageRoute});

  final String setupPageRoute;

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        initialRoute: setupPageRoute,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case routePrefixOnboardingFirst:
        page = const OnboardingFirst();
      case routePrefixOnboardingSecondPage:
        page = const OnboardingSecond();
      case routePrefixOnboardingThirdPage:
        page = OnboardingThird();
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return page;
      },
      settings: settings,
    );
  }
}
