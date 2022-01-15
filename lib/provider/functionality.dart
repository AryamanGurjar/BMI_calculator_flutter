import 'package:bmi/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:bmi/mainScreen.dart';

class Function_operation extends ChangeNotifier {
  Color container_color = Color(0xff1d1e33);
  Color inactive_color = Color(0xFF111328);
  Color male_color = Color(0xFF111328);
  Color female_color = Color(0xFF111328);
  // int value = 0;
  //int result=0;

  void Change_colour_on_click(GenderType value) {
    if (value == GenderType.male) {
      male_color = container_color;
      female_color = Color(0xFF111328);
      notifyListeners();
    } else if (value == GenderType.female) {
      female_color = container_color;
      male_color = Color(0xFF111328);
      notifyListeners();
    }
  }

  int weight = 60;
  void operations(Operation value) {
    if (value == Operation.plus) {
      weight++;
      notifyListeners();
    } else if (value == Operation.minus) {
      weight--;
      notifyListeners();
    }
  }

  int age = 24;
  void operations_age(Operation value) {
    if (value == Operation.plus) {
      age++;
      notifyListeners();
    } else if (value == Operation.minus) {
      age--;
      notifyListeners();
    }
  }

  String Result_bmi = "Error in counting\nSorry for our Inconvinience";
  String Image = "images/healthy.gif";
  void result_page_cal() {
    double bmi = (weight * 100 * 100) / (result * result);
    if (bmi < 18.5) {
      Result_bmi = "You are Underweight";
      Image = "images/underweight.gif";
      notifyListeners();
    } else if (bmi >= 18.5 && bmi < 25) {
      Result_bmi = "You are Normal weight";
      Image = "images/healthy.gif";
      notifyListeners();
    } else if (bmi >= 25 && bmi < 30) {
      Result_bmi = "You are Overweight";
      Image = "images/overweight.gif";
      notifyListeners();
    } else {
      Result_bmi = "You are obese";
      Image = "images/extreamly overweight.gif";
      notifyListeners();
    }
  }

  //   void Slider_value_change(int value)
  // {
  //     result = value;
  //     notifyListeners();
  // }
  //Tried to use Ternary Operator
  // Color selected_button = Color(0xFF111328);
  //
  // Toggle_Colour_male(GenderType? SelectedGender) {
  //  selected_button = SelectedGender == GenderType.male ? container_color : inactive_color;
  // print(selected_button);
  //  //selected_button= SelectedGender == GenderType.female ? container_color : inactive_color;
  //   notifyListeners();
  // }
  // Toggle_Colour_female(GenderType? SelectedGender) {
  //   //selected_button = SelectedGender == GenderType.male ? container_color : inactive_color;
  //   selected_button= SelectedGender == GenderType.female ? container_color : inactive_color;
  //   print(selected_button);
  //   notifyListeners();
  // }
}
