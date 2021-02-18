import 'package:flutter/material.dart';

class ContainerDesigned extends StatelessWidget {
  const ContainerDesigned({Key key, this.child, this.height, this.width})
      : super(key: key);
  final child;
  final height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('web/assets/images/circles_bg.png'),
            alignment: Alignment.topRight),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xffFFFFFF), Color(0xffDDE7F3)],
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: child,
    );
  }
}
