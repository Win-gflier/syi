import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../features/main/presentation/pages/base.dart';
import '../../features/main/presentation/pages/home.dart';
import '../../features/onboarding/presentation/pages/onboarding.dart';
import '../../features/onboarding/presentation/pages/onboarding_first.dart';
import '../../features/onboarding/presentation/pages/onboarding_second.dart';
import '../../features/onboarding/presentation/pages/onboarding_third.dart';

const String routePrefix = '/';
const String routePrefixOnboardingFirst = routePrefix;
const String routePrefixOnboardingSecondPage = '$routePrefix/second';
const String routePrefixOnboardingThirdPage = '$routePrefix/third';

const String routePrefixMain = '/';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget page;

    if (FirebaseAuth.instance.currentUser != null) {
      page = Base(
        setupPageRoute: routePrefixMain,
      );
    } else {
      page = Onboarding(
        setupPageRoute: routePrefixOnboardingFirst,
      );
    }
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return page;
      },
      settings: settings,
    );
  }

  static Route<dynamic> onGenerateMainRoute(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {

      case routePrefixMain:
        page = const Home();

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

  static Route<dynamic> onGenerateOnboardingRoute(RouteSettings settings) {
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
