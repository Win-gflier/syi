import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/router.dart';

class Base extends StatelessWidget {
  Base({super.key, required this.setupPageRoute});

  final String setupPageRoute;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
          initialRoute: setupPageRoute,
          onGenerateRoute: AppRouter.onGenerateMainRoute),
    );
  }
}
