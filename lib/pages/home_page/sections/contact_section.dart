import 'package:flutter/material.dart';
import 'package:website_video_animation/helper_functions/helper_functions.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              style: TextStyle(fontSize: 18.0, height: 1.6),
              children: [
                TextSpan(
                    text:
                        "Want to get in touch ? Drop me a message below or at\n"),
                TextSpan(
                    text: "pixediodesigns@gmail.com ",
                    style: TextStyle(decoration: TextDecoration.underline)),
                TextSpan(text: "or hit me up on discord and more!"),
              ],
            ),
          ),
          SizedBox(height: size.height * .05),
          ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  ContactForm({Key key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTextField(hintText: 'ENTER YOUR NAME*'),
          CustomTextField(
            hintText: 'ENTER YOUR EMAIL*',
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextField(
            hintText: 'PHONE NUMBER',
            keyboardType: TextInputType.number,
          ),
          CustomTextArea(
            hintText: 'MESSAGE',
          ),
          SubmitContactForm(),
        ],
      ),
    );
  }
}

const kInputWidth = 450.0;
enum customKeyType { email, number }

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
  final hintText;
  final bool isPassword;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 3.0),
            bottom: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 3.0),
          ),
        ),
        width: kInputWidth,
        child: TextFormField(
          obscureText: isPassword,
          keyboardType: keyboardType,
          cursorHeight: 20.0,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({Key key, this.hintText}) : super(key: key);
  final hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 3.0),
            bottom: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 3.0),
          ),
        ),
        width: kInputWidth,
        child: TextFormField(
          minLines: 5,
          maxLines: 5,
          cursorHeight: 20.0,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitContactForm extends StatelessWidget {
  const SubmitContactForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.black),
        overlayColor:
            MaterialStateProperty.resolveWith((states) => Colors.transparent),
      ),
      onPressed: () => null,
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
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                  style: BorderStyle.solid, color: Colors.black, width: 2.0),
              right: BorderSide(
                  style: BorderStyle.solid, color: Colors.black, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}
