import 'package:flutter/material.dart';
import 'package:website_video_animation/helper_functions/helper_functions.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Container(
      height: size.height,
      width: size.width,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width <= 500 ? 10 : 150.0),
        child: Container(
          width: 500,
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100.0,
              ),
              Text(
                'TARGET',
                style: TextStyle(
                    fontSize: sectionTextSize(size.width),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 35.0,
              ),
              Text(
                'Target your users with dynamic designs that represent your\nbrand',
                style: TextStyle(fontSize: 16.0, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
