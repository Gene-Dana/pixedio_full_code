import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:video_player/video_player.dart';
import 'package:website_video_animation/pages/home_page/sections/fourth_section.dart';

import 'sections/contact_section.dart';
import 'sections/footer.dart';
import 'sections/first_section.dart';
import 'sections/second_section.dart';
import 'sections/third_section.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool clickDelay = false;
  bool showcase = true;
  int pageNumber = 0;

  final ScrollController _controller = ScrollController();

  VideoPlayerController _videoPlayerController;

  Future<void> initializeVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset('web/assets/ball_vid.mp4');

    await _videoPlayerController.initialize();

    setState(() {});
  }

  @override
  void initState() {
    initializeVideoPlayer();
    super.initState();
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
                : Container(
                    child: Text(
                      "Loading",
                    ),
                  ),
          ),
          Listener(
            onPointerSignal: (PointerSignalEvent event) {
              if (event is PointerScrollEvent) {
                if (clickDelay == true) {
                  return;
                } else {
                  // This works as a switch
                  if (showcase) {
                    clickDelay = true;
                    Future.delayed(const Duration(milliseconds: 4500), () {
                      clickDelay = false;
                    });
                  }

                  if (event.scrollDelta.dy.isNegative) {
                    // Scrolled up
                    _videoPlayerController.pause();

                    if (pageNumber == 1) {
                      _videoPlayerController.seekTo(Duration(seconds: 0));
                    } else if (pageNumber == 2) {
                      _videoPlayerController.seekTo(Duration(seconds: 4));
                    }

                    // if (showcase) {
                    //   if (pageNumber == 5) {
                    //     setState(() {
                    //       _controller.animateTo(
                    //           _controller.position.extentBefore - 300,
                    //           duration: Duration(milliseconds: 2250),
                    //           curve: Curves.linear);
                    //     });
                    //   } else {
                    //     setState(() {
                    //       _controller.animateTo(
                    //           _controller.position.extentBefore -
                    //               MediaQuery.of(context).size.height,
                    //           duration: Duration(milliseconds: 4500),
                    //           curve: Curves.linear);
                    //     });
                    //   }
                    // }
                    setState(() {});
                    if (pageNumber - 1 <= 0)
                      pageNumber = 0;
                    else
                      pageNumber--;
                  } else {
                    // if (pageNumber == 5) {
                    //   pageNumber++;
                    // }
                    // if (pageNumber == 4) {
                    //   pageNumber++;
                    // }
                    if (pageNumber == 3) {
                      setState(() {
                        showcase = false;
                      });
                      pageNumber++;
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
              }
            },
            child: SingleChildScrollView(
              controller: _controller,
              physics:
                  showcase ? NeverScrollableScrollPhysics() : ScrollPhysics(),
              child: Column(
                children: [
                  FirstPage(),
                  SecondSection(),
                  ThirdSection(),
                  FourthSection(),
                  ContactSection(),
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
