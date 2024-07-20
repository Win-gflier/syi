import 'package:flutter/material.dart';

import '../../../../core/router/router.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/bullet_point.dart';
import '../../../../core/widgets/primary_button.dart';
import 'onboarding.dart';

class OnboardingSecond extends StatelessWidget {
  const OnboardingSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'SYI - Share Your Ideas',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Image.asset('assets/onboarding_2_image.webp')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Text(
                              'Here you can :',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 16),
                            const BulletPoint(
                              text: 'Propose and discuss innovative app ',
                              highlightedText: 'ideas',
                            ),
                            const BulletPoint(
                              text:
                                  'Vote for your favorites to support development',
                            ),
                            const BulletPoint(
                              text: 'Collaborate on exciting projects',
                            ),
                            const BulletPoint(
                              text: 'Engage with a community of creators',
                            ),
                            const BulletPoint(
                              text: 'Hire or get hired',
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            RichText(
                              text: TextSpan(
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                text: 'Be part of a ',
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'community',
                                    style: TextStyle(color: AppColors.yellow),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: PrimaryButton(
                    label: 'Next',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, routePrefixOnboardingThirdPage);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
