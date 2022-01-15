import 'package:bmi/provider/functionality.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/custom_widget/card_design.dart';
import 'package:bmi/custom_widget/icon_text_widget.dart';
import 'package:provider/provider.dart';
import 'ResultPage.dart';

enum GenderType {
  male,
  female,
}

enum Operation {
  plus,
  minus,
}

int result = 180;

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic size, height;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height * 0.25;

    return Consumer<Function_operation>(
      builder: (context, provider, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'BMI',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              //  backgroundColor: primaryColor,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(
                      child: boxes(
                        //refer to custom_widget => card_design.dart
                        boxColour: provider.male_color,
                        tap: () {
                          provider.Change_colour_on_click(GenderType.male);
                        },
                        height_variable: height,
                        child: card_design(
                          icon: const FaIcon(
                            // refer to custom_widget => icon_text_widget.dart
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          ),
                          text: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: boxes(
                        tap: () {
                          provider.Change_colour_on_click(GenderType.female);
                        },
                        boxColour: provider.female_color,
                        height_variable: height,
                        child: card_design(
                          text: "FEMALE",
                          icon: const FaIcon(
                            FontAwesomeIcons.venus,
                            size: 80.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: boxes(
                    boxColour: provider.container_color,
                    height_variable: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: Textdesign,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              result.toString(),
                              style: kMiddleDesign,
                            ),
                            Text(
                              ' cm',
                              style: Textdesign,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                          ),
                          child: Slider(
                            min: 1,
                            max: 250,
                            thumbColor: Colors.pinkAccent,
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey,
                            value: result.toDouble(),
                            onChanged: (double _value) {
                              // provider.Slider_value_change(_value.toInt());    ==> not updating slider as we need to rebuild the screen so we have to use a setstate instead of Provider
                              setState(
                                () {
                                  result = _value.toInt();
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(
                      child: boxes(
                        boxColour: provider.container_color,
                        height_variable: height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: Textdesign,
                            ),
                            Text(
                              provider.weight.toString(),
                              style: kMiddleDesign,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Round_Icon_button(
                                  Icon: Icon(FontAwesomeIcons.minus),
                                  Operation_to_be_done: () {
                                    provider.operations(Operation.minus);
                                  },
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Round_Icon_button(
                                  Operation_to_be_done: () {
                                    provider.operations(Operation.plus);
                                  },
                                  Icon: Icon(FontAwesomeIcons.plus),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: boxes(
                        boxColour: provider.container_color,
                        height_variable: height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: Textdesign,
                            ),
                            Text(
                              provider.age.toString(),
                              style: kMiddleDesign,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Round_Icon_button(
                                  Icon: Icon(FontAwesomeIcons.minus),
                                  Operation_to_be_done: () {
                                    provider.operations_age(Operation.minus);
                                  },
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Round_Icon_button(
                                  Operation_to_be_done: () {
                                    provider.operations_age(Operation.plus);
                                  },
                                  Icon: Icon(FontAwesomeIcons.plus),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    provider.result_page_cal();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                      child: const Text(
                        'CALCULATE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 42.0,
                            letterSpacing: 3.0),
                      ),
                      width: double.infinity,
                      height: 56.0,
                      margin: const EdgeInsets.only(top: 5.0),
                      color: Colors.pinkAccent),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Round_Icon_button extends StatelessWidget {
  Round_Icon_button({this.Icon, this.Operation_to_be_done});

  final Widget? Icon;
  final VoidCallback? Operation_to_be_done;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: Operation_to_be_done,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: const Color(0xff4c4f5e),
      shape: const CircleBorder(),
      child: Icon,
    );
  }
}
