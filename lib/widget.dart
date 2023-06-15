import 'package:flutter/material.dart';

const header = TextStyle(
  color: Colors.white,
  fontSize: 30,
  height: 1.5,
);

const subheading = TextStyle(
  color: Colors.white,
  fontSize: 24,
  height: 1.5,
);

Widget getField(headerTxt, imageSrc, descTxt) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          headerTxt,
          style: header,
        ),
        const SizedBox(height: 30),
        Center(
          child: Image(
            image: AssetImage(imageSrc),
            height: 400,
            width: 400,
          ),
        ),
        const SizedBox(height: 30),
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
          duration: const Duration(microseconds: 300), curve: Curves.easeIn);
    },
    child: const Text(
      'Next',
      style: TextStyle(color: Colors.white, fontSize: 24),
    ),
  );
}

BoxDecoration getDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.9],
          colors: [Color(0xFF4d4d4d), Color(0xFFeeeceb), Color(0xFF4d4d4d)]));
}

Widget indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(microseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: 10,
    width: isActive ? 30 : 20,
    decoration: BoxDecoration(
      color: isActive ? Colors.white : Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
  );
}
