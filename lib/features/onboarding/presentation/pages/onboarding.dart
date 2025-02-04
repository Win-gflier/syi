import 'package:flutter/material.dart';

import '../../../../core/router/router.dart';

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
          onGenerateRoute: AppRouter.onGenerateOnboardingRoute),
    );
  }
}
