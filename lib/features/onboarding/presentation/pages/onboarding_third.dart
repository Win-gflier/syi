import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:video_player/video_player.dart';

import '../../../../core/router/router.dart';
import '../../../../core/styles/colors.dart';
import '../providers/auth_providers.dart';

class OnboardingThird extends ConsumerWidget {
  OnboardingThird({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInButton = ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        side: const BorderSide(
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(12),
        // Text and icon color
      ),
      icon: Platform.isAndroid
          ? SvgPicture.asset('assets/google_icon.svg')
          : SvgPicture.asset('assets/apple_icon.svg'),
      label: Text(
        Platform.isAndroid ? 'Continue with Gmail' : 'Sign in with Apple',
      ),
      onPressed: () {
        if (Platform.isAndroid) {
          googleSignIn(ref);
        } else {
          appleSignIn();
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Spacer(flex: 2),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/onboarding_icon.svg'),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    'SYI - Share Your Ideas',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: signInButton,
                  ),
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                        text: TextSpan(
                            text: 'By continuing you agree to',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontSize: 18, color: Colors.white),
                            children: const <InlineSpan>[
                          TextSpan(
                              text: ' terms and conditions',
                              style: TextStyle(color: AppColors.yellow),
                              children: [
                                TextSpan(
                                    text: ' and\n',
                                    style: TextStyle(color: Colors.white),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: ' privacy policy',
                                        style:
                                            TextStyle(color: AppColors.yellow),
                                      )
                                    ])
                              ])
                        ])),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32)
          ],
        ),
      ),
    );
  }

  void googleSignIn(WidgetRef ref) {
    print('onboarding_third');
    ref.read(authStateNotifierProvider.notifier).signInWithGoogle();
  }

  void appleSignIn() {}
}
