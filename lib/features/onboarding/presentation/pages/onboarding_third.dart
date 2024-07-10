import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/injections.dart';
import '../../domain/usecases/auth_usecase.dart';
import '../bloc/auth_bloc.dart';

class OnboardingThird extends StatelessWidget {
  OnboardingThird({super.key});

  final AuthBloc _bloc = AuthBloc(authsUseCase: sl<AuthUsecase>());

  @override
  Widget build(BuildContext context) {
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .headlineLarge,
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
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
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
                      icon: SvgPicture.asset('assets/google_icon.svg'),
                      label: const Text(
                        'Continue with Gmail',
                      ),
                      onPressed: () {
                        googleSignIn();
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                        text: TextSpan(
                            text: 'By continuing you agree to',
                            style: Theme
                                .of(context)
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

  void googleSignIn({bool withLoading = true}) {
    _bloc.add(
      OnAuthEvent(
        withLoading: withLoading,
      ),
    );
  }
}
