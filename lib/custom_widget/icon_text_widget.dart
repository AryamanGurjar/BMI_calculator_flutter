import 'package:flutter/material.dart';

TextStyle Textdesign = const TextStyle(
  color: Color(0xff8d8e98),
  fontSize: 18.0,
);

TextStyle kMiddleDesign = const TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

class card_design extends StatelessWidget {
  card_design({required this.icon, required this.text});

  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          height: 20.0,
        ),
        Text(text, style: Textdesign),
      ],
    );
  }
}
