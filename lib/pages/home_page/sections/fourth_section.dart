import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FourthSection extends StatefulWidget {
  const FourthSection({Key key}) : super(key: key);

  @override
  _FourthSectionState createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection> {
  bool onScroll = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return VisibilityDetector(
      key: Key('test-key'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 0)
          setState(() {
            onScroll = false;
          });
        ;
        if (!onScroll) {
          if (info.visibleFraction * 100 >= 20) {
            Future.delayed(Duration(milliseconds: 2000)).then((value) {
              setState(() {
                onScroll = true;
              });
            });
          }
        }
      },
      child: AnimatedContainer(
        curve: Curves.linear,
        duration: Duration(milliseconds: 500),
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
            gradient: onScroll
                ? LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xffFFFFFF), Color(0xffDDE7F3)],
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 60.0,
                    right: 60.0,
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 5.0,
                    ),
                  ),
                  child: Text(
                    "PORTFOLIO",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'galderglynn_titling_rg',
                    ),
                  ),
                ),
                PortfolioContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PortfolioContent extends StatelessWidget {
  const PortfolioContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 500,
      child: LayoutGrid(
        rowGap: 1.0,
        columnGap: 1.0,
        areas: '''
                  img6 img5 img4
                  img3 img2 img1
                  ''',
        columnSizes: [1.fr, 1.fr, 1.fr],
        rowSizes: [1.fr, 1.fr],
        children: [
          NamedAreaGridPlacement(
            areaName: 'img6',
            child: PortoflioItem(
              imageName: 'images/img6.png',
            ),
          ),
          NamedAreaGridPlacement(
            areaName: 'img5',
            child: PortoflioItem(
              imageName: 'images/img5.png',
            ),
          ),
          NamedAreaGridPlacement(
            areaName: 'img4',
            child: PortoflioItem(
              imageName: 'images/img4.png',
            ),
          ),
          NamedAreaGridPlacement(
            areaName: 'img3',
            child: PortoflioItem(
              imageName: 'images/img3.png',
            ),
          ),
          NamedAreaGridPlacement(
            areaName: 'img2',
            child: PortoflioItem(
              imageName: 'images/img2.png',
            ),
          ),
          NamedAreaGridPlacement(
            areaName: 'img1',
            child: PortoflioItem(
              imageName: 'images/img1.png',
            ),
          ),
        ],
      ),
    );
  }
}

class PortoflioItem extends StatelessWidget {
  final imageName;

  const PortoflioItem({Key key, this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Image.asset(
        imageName,
        fit: BoxFit.scaleDown,
        height: 200,
      ),
    );
  }
}
