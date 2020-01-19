import 'dart:math';

class Brain {

  Brain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi >= 25) {
      return "Overweight";
    } else if (_bmi <= 18.5){
      return "Underweight";
    } else {
      return "Normal";
    }
  }

  String getInterpretation() {
    if(_bmi >= 25) {
      return "You're fat af, go to the gym and stop eating junk food.";
    } else if (_bmi <= 18.5){
      return "Go get hit some weights and look for some carbs bro...";
    } else {
      return "Normal, you are able to drink and eat whatever you want consciously";
    }
  }

}