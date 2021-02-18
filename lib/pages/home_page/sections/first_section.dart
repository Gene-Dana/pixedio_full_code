import 'package:flutter/material.dart';

const headingTextStyle = TextStyle(fontSize: 56.0);

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 100.0,
            vertical: 25.0,
          ),
          child: Column(
            children: [
              HeaderNav(),
              Spacer(),
              // TODO: This is the first mock screen, with layouts that will scale nicely.
              MainContent(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    style: headingTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'WELCOME TO ',
                      ),
                      TextSpan(
                        text: 'PIXEDIO - DYNAMIC\nDESIGNS, ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'AND '),
                      TextSpan(
                        text: 'ENGAGING ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'PAGES'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 600,
                  child: Wrap(direction: Axis.horizontal, children: [
                    Text(
                      "Nice to meet you ! My name is Dawson and I am a self taught Designer. My current tool is figma and I am now learning how to make realistic animations with Cinema 4D as you can see on my website (still learning so may be unable to incorporate to your design). I’d love to design and develop your website !",
                      style: TextStyle(fontSize: 20, height: 1.6),
                    ),
                  ]),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class HeaderNav extends StatelessWidget {
  const HeaderNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PersonalBrand(),
        Container(
          width: 300,
          child: Row(
            children: [
              Text('About'),
              Spacer(),
              Text('Services'),
              Spacer(),
              Text('Contact'),
            ],
          ),
        ),
      ],
    );
  }
}

class PersonalBrand extends StatelessWidget {
  const PersonalBrand({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pixedio - ',
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.black, fontFamily: 'Cervanttis'),
        ),
        Text('Design and Dev',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300)),
      ],
    );
  }
}
