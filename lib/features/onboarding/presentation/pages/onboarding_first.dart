import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/router/router.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/constant/storage.dart';
import '../../../../core/widgets/primary_button.dart';
import 'onboarding.dart';

class OnboardingFirst extends StatefulWidget {
  const OnboardingFirst({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingFirstState();
}

class _OnboardingFirstState extends State<OnboardingFirst> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(Storage.onboardingVideoUrl),
    );

    _controller.addListener(() {
      if (!_controller.value.isPlaying &&
          _controller.value.isInitialized &&
          (_controller.value.duration == _controller.value.position)) {
        //checking the duration and position every time
        _controller.play();
      }
    });

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {});
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          _controller.play();

                          return Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 1.0,
                                child: VideoPlayer(_controller),
                              ),
                              SvgPicture.asset(
                                  'assets/onboarding_icon_text.svg')
                            ],
                          );
                        } else {
                          return const Center(
                            child: AspectRatio(
                              aspectRatio: 1.0,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        child: SvgPicture.asset('assets/line_dash.svg',
                            fit: BoxFit.fill)),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headlineMedium,
                              text:
                                  'Welcome to SYI \nJoin a community eager to bring app',
                              children: const <TextSpan>[
                                TextSpan(
                                  text: ' ideas ',
                                  style: TextStyle(color: AppColors.yellow),
                                  children: <InlineSpan>[
                                    TextSpan(text: 'to life.')
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Share your concepts, vote on the best, and collaborate\nto turn imagination into reality',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
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
                    label: 'Begin your creative journey',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, routePrefixOnboardingSecondPage);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
