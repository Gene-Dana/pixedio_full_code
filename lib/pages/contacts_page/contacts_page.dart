import 'package:flutter/material.dart';
import 'package:pixedio_works/components/container_designed.dart';
import 'package:pixedio_works/components/header_nav.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';
import 'package:pixedio_works/pages/home_page/sections/footer.dart';

import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

import '../../constants.dart';

class ContactPage extends StatelessWidget {
  static const String id = "contacts_page";
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Scaffold(
      body: Stack(children: [
        ContainerDesigned(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  height: size.height <= 800 ? size.height + 180 : size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Contact',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: bodyFontSize(size.width),
                              height: 1.6,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text:
                                    "Want to get in touch ? Drop me a message below or at\n"),
                            TextSpan(
                                text: "pixediodesigns@gmail.com ",
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                            TextSpan(text: "or hit me up on discord and more!"),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * .05),
                      ContactForm(),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Footer(),
              ],
            ),
          ),
        ),
        HeaderNav(),
      ]),
    );
  }
}

class ContactForm extends StatefulWidget {
  ContactForm({Key key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  var fName = '';
  var fNumber = '';
  var fEmail = '';
  var fMessage = '';

  Future<String> postForm() async {
    // print(fName);
    // print(fNumber);
    // print(fEmail);
    // print(fMessage);
    final response = await http.post(
        // https://localhost:5001/mail-server-301117/us-central1/
        // "https://us-central1-mail-server-301117.cloudfunctions.net/sendMail?type=seamlesse&location=testing&name=" +

        "https://us-central1-mail-server-301117.cloudfunctions.net/sendMail?type=portfolio&location=flutter&name=" +
            fName +
            "&number=" +
            fNumber +
            "&email=" +
            fEmail +
            "&message=" +
            fMessage);

    if (response.statusCode == 200) {
      print('success');
      return 'success';
    } else {
      print('not success');
      throw Exception('not success');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Name
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 3.0),
                  bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 3.0),
                ),
              ),
              width: getInputWidth(MediaQuery.of(context).size),
              child: TextFormField(
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
                cursorHeight: 20.0,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'ENTER YOUR NAME',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a name';
                  }
                  fName = value;
                  return null;
                },
              ),
            ),
          ),
          // Email
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 3.0),
                  bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 3.0),
                ),
              ),
              width: getInputWidth(MediaQuery.of(context).size),
              child: TextFormField(
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
                cursorHeight: 20.0,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'ENTER YOUR EMAIL',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!value.isEmail) {
                    return 'Please enter a valid email';
                  }
                  fEmail = value;
                  return null;
                },
              ),
            ),
          ),
          // Number
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 3.0),
                  bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 3.0),
                ),
              ),
              width: getInputWidth(MediaQuery.of(context).size),
              child: TextFormField(
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
                cursorHeight: 20.0,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'ENTER YOUR NUMBER',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a number';
                  }
                  fNumber = value;
                  return null;
                },
              ),
            ),
          ),
          // Message
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 3.0),
                  bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 3.0),
                ),
              ),
              width: getInputWidth(MediaQuery.of(context).size),
              child: TextFormField(
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
                minLines: 5,
                maxLines: 5,
                cursorHeight: 20.0,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'MESSAGE',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a message';
                  }
                  fMessage = value;
                  return null;
                },
              ),
            ),
          ),
          // Submit button + some extra
          Container(
            width: double.infinity,
            child: Stack(children: [
              Center(
                child: TextButton(
                  style: kTextButtonStyle,
                  onPressed: () => {
                    if (_formKey.currentState.validate())
                      {
                        // If the form is valid, send email.
                        // postForm();

                        // if gucci, display a Snackbar.

                        showDialog(
                          context: context,
                          builder: (context) => FutureBuilder<String>(
                            future: postForm(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Timer(
                                  Duration(seconds: 1),
                                  () {
                                    Navigator.of(context).pop();
                                    _formKey.currentState.reset();
                                  },
                                );

                                return Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 80,
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                          barrierDismissible: false,
                        )
                      }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 42.0,
                        ),
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: 2.0),
                          right: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.width <= 800 ? 0 : 25,
                right: size.width <= 800 ? 0 : 25,
                child: size.width <= 800
                    ? Column(
                        children: [
                          TextButton(
                              style: kTextButtonStyle,
                              onPressed: () => redirectDiscord(),
                              child: CustomImageIcon('images/discord.png')),
                          SizedBox(height: 10.0),
                          TextButton(
                              style: kTextButtonStyle,
                              onPressed: () => null,
                              child: CustomImageIcon('images/whatsapp.png')),
                        ],
                      )
                    : Row(
                        children: [
                          TextButton(
                              style: kTextButtonStyle,
                              onPressed: () => redirectDiscord(),
                              child: CustomImageIcon('images/discord.png')),
                          TextButton(
                              style: kTextButtonStyle,
                              onPressed: () => null,
                              child: CustomImageIcon('images/whatsapp.png')),
                        ],
                      ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

extension ExtendedString on String {
  bool _hasMatch(String value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  bool get isEmail => _hasMatch(
        this,
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );
}
