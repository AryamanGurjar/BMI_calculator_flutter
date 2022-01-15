import 'package:bmi/provider/functionality.dart';
import 'package:flutter/material.dart';
import 'package:bmi/custom_widget/card_design.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: boxes(
              boxColour:
                  Provider.of<Function_operation>(context).container_color,
              height_variable: 530.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Your Result',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                        Provider.of<Function_operation>(context).Image),
                  ),
                  Text(
                    Provider.of<Function_operation>(context, listen: false)
                        .Result_bmi,
                    style: const TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                child: const Text(
                  'RE-CALCULATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 42.0,
                      letterSpacing: 1.6),
                ),
                width: double.infinity,
                height: 56.0,
                margin: const EdgeInsets.only(top: 5.0),
                color: Colors.pinkAccent),
          ),
        ],
      ),
    );
  }
}
