import 'package:flutter/material.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 150.0),
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
                style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
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
