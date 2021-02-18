import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xffFFFFFF), Color(0xffDDE7F3)],
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Pixedio',
              style: TextStyle(fontFamily: 'Cervanttis', fontSize: 32.0),
            ),
            Text(
              "Copyright © 2020. Pixedio. All rights reserved.",
            ),
            Container(
              width: 600.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "About",
                  ),
                  Text(
                    "Services",
                  ),
                  Text(
                    "Contact",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon('images/discord.png'),
                ImageIcon('images/whatsapp.png'),
              ],
            )
          ],
        ),
        // TODO: Your Fifth Screen goes here
      ),
    );
  }
}

class ImageIcon extends StatelessWidget {
  ImageIcon(this.imageName);
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        child: Image.asset(
          imageName,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
