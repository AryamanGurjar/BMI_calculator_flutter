import 'package:flutter/material.dart';

class boxes extends StatelessWidget {
  boxes(
      {required this.boxColour,
      required this.height_variable,
      this.child,
      this.tap});

  final Color boxColour;
  final double height_variable;
  final Widget? child; //it is added as i have to not show it required
  final void Function()? tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        height: height_variable,
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: boxColour,
        ),
      ),
    );
  }
}
