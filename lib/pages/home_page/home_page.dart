import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:video_player/video_player.dart';
import 'package:pixedio_works/components/container_designed.dart';
import 'package:pixedio_works/components/header_nav.dart';

import 'package:pixedio_works/pages/home_page/sections/portfolio_section.dart';

import 'sections/contact_section.dart';
import 'sections/footer.dart';
import 'sections/welcome_section.dart';
import 'sections/second_section.dart';
import 'sections/third_section.dart';

class MyHomePage extends StatefulWidget {
  static const String id = 'home_page';
  final orientation;

  const MyHomePage({Key key, this.orientation}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final contactKey = GlobalKey();
  bool clickDelay = false;
  bool showcase = true;
  bool hideHint = false;
  int pageNumber = 0;

  final ScrollController _controller = ScrollController();

  VideoPlayerController _videoPlayerController;

  Future<void> initializeVideoPlayer(orientation) async {
    switch (orientation) {
      case Orientation.landscape:
        _videoPlayerController =
            VideoPlayerController.asset('web/assets/ball_vid.mp4');
        break;
      case Orientation.portrait:
        _videoPlayerController =
            VideoPlayerController.asset('web/assets/ball_mobile.mp4');
        break;
    }

    await _videoPlayerController.initialize();

    setState(() {});
  }

  @override
  void initState() {
    initializeVideoPlayer(widget.orientation);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = _videoPlayerController.value.size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 3000),
            curve: Curves.linear,
            opacity: pageNumber >= 3 ? 0.0 : 1.0,
            child: _videoPlayerController != null &&
                    _videoPlayerController.value.initialized
                ? ClipRect(
                    child: OverflowBox(
                      maxWidth: double.infinity,
                      maxHeight: double.infinity,
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        child: Container(
                          width: size.width,
                          height: size.height,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: AvatarGlow(
                      endRadius: 20,
                      child: SizedBox(
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
          ),
          showcase ? SizedBox.shrink() : ContainerDesigned(),
          Listener(
            onPointerSignal: (PointerSignalEvent event) {
              if (event is PointerScrollEvent) {
                if (clickDelay == true) {
                  return;
                } else if (showcase) {
                  // This works as a switch
                  clickDelay = true;

                  if (pageNumber == 1) {
                    Future.delayed(const Duration(milliseconds: 13050), () {
                      clickDelay = false;
                      setState(() {
                        _controller.animateTo(
                            _controller.position.extentBefore +
                                MediaQuery.of(context).size.height,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      });

                      Future.delayed(const Duration(milliseconds: 750), () {
                        setState(() {
                          showcase = false;
                        });
                      });
                    });
                  } else {
                    Future.delayed(const Duration(milliseconds: 4500), () {
                      clickDelay = false;
                    });
                  }

                  if (pageNumber == 2) {
                    pageNumber++;
                  }
                  // Scrolled down
                  if (pageNumber == 0) {
                    pageNumber++;
                    _videoPlayerController.play();
                    // The first stop on the video is after 4 and a half seconds
                    Future.delayed(Duration(milliseconds: 4500), () {
                      _videoPlayerController.pause();
                    });
                  } else if (pageNumber == 1) {
                    setState(() {
                      hideHint = true;
                    });
                    pageNumber++;
                    _videoPlayerController.play();
                  }
                  print(pageNumber);
                  if (showcase) {
                    setState(() {
                      _controller.animateTo(
                          _controller.position.extentBefore +
                              MediaQuery.of(context).size.height,
                          duration: Duration(milliseconds: 3000),
                          curve: Curves.linear);
                    });
                  }
                }
              }
            },
            child: SingleChildScrollView(
              controller: _controller,
              physics:
                  showcase ? NeverScrollableScrollPhysics() : ScrollPhysics(),
              child: Column(
                children: [
                  WelcomeSection(),
                  SecondSection(),
                  ThirdSection(),
                  PortfolioSection(),
                  SizedBox.shrink(
                    key: contactKey,
                  ),
                  ContactSection(),
                  Footer(
                    contactsKey: contactKey,
                    contactsPressed: () async {
                      setState(() {
                        showcase = false;
                      });
                      await Future.delayed(Duration(milliseconds: 100));
                      setState(() {
                        hideHint = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          !hideHint
              ? Positioned(
                  right: MediaQuery.of(context).size.width / 20,
                  bottom: MediaQuery.of(context).size.height / 16,
                  child: Column(
                    children: [
                      AvatarGlow(
                        repeatPauseDuration: Duration(milliseconds: 1500),
                        duration: Duration(milliseconds: 750),
                        endRadius: MediaQuery.of(context).size.width <= 800
                            ? 50
                            : 80.0,
                        glowColor: Colors.grey,
                        child: Container(
                          child: Image.asset(
                            'web/assets/images/Scroll.png',
                            height: MediaQuery.of(context).size.width <= 800
                                ? 45
                                : 75.0,
                          ),
                        ),
                      ),
                      Text(
                        'Scroll to animate',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width <= 800
                                ? 10
                                : 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              : Container(),
          HeaderNav(
            contactsKey: contactKey,
            contactsPressed: () async {
              setState(() {
                showcase = false;
              });
              await Future.delayed(Duration(milliseconds: 100));
              setState(() {
                hideHint = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
