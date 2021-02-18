import 'package:flutter/material.dart';
import 'package:website_video_animation/helper_functions/helper_functions.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Container(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width <= 1000 ? 10 : 250.0,
            right: size.width <= 1000 ? 10 : 250.0,
            top: 100.0),
        child: Column(
          crossAxisAlignment: size.width <= 780
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.end,
          mainAxisAlignment: size.width <= 1000
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Text(
              'ENGAGE',
              style: TextStyle(
                  fontSize: sectionTextSize(size.width),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 35.0,
            ),
            Text(
              'Designs that envoke the user\'s emotions and keeps them \nengaged',
              style: TextStyle(fontSize: bodyFontSize(size.width), height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
