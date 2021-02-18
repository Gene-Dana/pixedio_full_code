import 'package:flutter/material.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(right: 250.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ENGAGE',
                style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 35.0,
              ),
              Text(
                'Designs that envoke the user\'s emotions and keeps them \nengaged',
                style: TextStyle(fontSize: 16.0, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
