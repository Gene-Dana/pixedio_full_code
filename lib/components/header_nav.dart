import 'package:flutter/material.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';
import 'package:pixedio_works/pages/about_page/about_page.dart';
import 'package:pixedio_works/pages/home_page/home_page.dart';
import 'package:pixedio_works/pages/services_page/services_page.dart';

import '../constants.dart';
import 'nav_button.dart';

class HeaderNav extends StatelessWidget {
  const HeaderNav({
    Key key,
    this.contactsKey,
    this.contactsPressed,
  }) : super(key: key);
  final GlobalKey contactsKey;
  final VoidCallback contactsPressed;

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width <= 620 ? 10.0 : 100.0,
        vertical: 25.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PersonalBrand(),
          size.width <= 840
              ? DropdownNav(
                  contactsKey: contactsKey,
                  contactsPressed: contactsPressed,
                )
              : Container(
                  width: 300,
                  child: Row(
                    children: [
                      NavButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, AboutPage.id),
                        text: 'About',
                      ),
                      Spacer(),
                      NavButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, ServicesPage.id),
                        text: 'Services',
                      ),
                      Spacer(),
                      NavButton(
                        onPressed: () async {
                          final currRoute =
                              ModalRoute.of(context).settings.name;
                          if (currRoute == MyHomePage.id) {
                            contactsPressed();
                            Scrollable.ensureVisible(
                                contactsKey.currentContext);
                          } else {
                            await Navigator.pushReplacementNamed(
                                context, MyHomePage.id);
                            await Scrollable.ensureVisible(
                                contactsKey.currentContext);
                            contactsPressed();
                          }
                        },
                        text: 'Contact',
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

const kPopStyleText = TextStyle(
  fontSize: 10.0,
);

class DropdownNav extends StatelessWidget {
  const DropdownNav({Key key, this.contactsKey, this.contactsPressed})
      : super(key: key);
  final contactsKey;
  final contactsPressed;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.menu),
      color: Colors.white,
      itemBuilder: (context) => [
        PopupMenuItem(
          textStyle: kPopStyleText,
          child: PopUpNavButton(
            onPressed: () => Navigator.pushNamed(context, AboutPage.id),
            text: 'About',
          ),
        ),
        PopupMenuItem(
          textStyle: kPopStyleText,
          child: PopUpNavButton(
            onPressed: () => Navigator.pushNamed(context, ServicesPage.id),
            text: 'Services',
          ),
        ),
        PopupMenuItem(
          textStyle: kPopStyleText,
          child: PopUpNavButton(
            onPressed: () async {
              final currRoute = ModalRoute.of(context).settings.name;
              if (currRoute == MyHomePage.id) {
                contactsPressed();
                Scrollable.ensureVisible(contactsKey.currentContext);
              } else {
                await Navigator.pushReplacementNamed(context, MyHomePage.id);
                await Scrollable.ensureVisible(contactsKey.currentContext);
                contactsPressed();
              }
            },
            text: 'Contact',
          ),
        ),
      ],
    );
  }
}

class PopUpNavButton extends StatelessWidget {
  const PopUpNavButton({Key key, @required this.onPressed, @required this.text})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Align(
        alignment: Alignment.center,
        child: NavButton(
          onPressed: onPressed,
          text: text,
        ),
      ),
    );
  }
}

class PersonalBrand extends StatelessWidget {
  const PersonalBrand({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: kTextButtonStyle,
          onPressed: () =>
              Navigator.pushReplacementNamed(context, MyHomePage.id),
          child: Text(
            'Pixedio - ',
            style: TextStyle(
                fontSize: size.width < 400 ? 24.0 : 36.0,
                fontFamily: 'Cervanttis'),
          ),
        ),
        Text(
          'Design and Dev',
          style: TextStyle(
              fontSize: size.width < 400 ? 18 : 28.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}
