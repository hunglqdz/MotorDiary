import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height * .2,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }
}
