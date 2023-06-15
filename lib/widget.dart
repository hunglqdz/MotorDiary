import 'dart:html';

import 'package:flutter/material.dart';

final header = TextStyle(
  color: Colors.white,
  fontSize: 30,
  height: 1.5,
);

final subheading = TextStyle(
  color: Colors.white,
  fontSize: 24,
  height: 1.5,
);

Widget getField(headerTxt, ImageSrc, descTxt) {
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            headerTxt,
            style: header,
          ),
        ),
        SizedBox(height: 30),
        Center(
          child: Image(
            image: AssetImage(imageSrc),
            height: 400,
            width: 400,
          ),
        ),
        SizedBox(height: 30),
        Text(
          descTxt,
          style: subheading,
        )
      ],
    ),
  );
}

Widget getButton(_pageController) {
  return TextButton(
    onPressed: () {
      _pageController.nextPage(
          duration: Duration(microseconds: 300), curve: Curves.easeIn);
    },
    child: Text(
      'Next',
      style: TextStyle(color: Colors.white, fontSize: 24),
    ),
  );
}

BoxDecoration getDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.9],
          colors: [Color(0xFF), Color(0xFF), Color(0xFF)]));
}

Widget indicator(bool isActive) {
  return AnimatedContainer(
    duration: Duration(microseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: 10,
    width: isActive ? 30 : 20,
    decoration: BoxDecoration(
      color: isActive ? Colors.white : Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}
