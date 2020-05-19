import 'package:flutter/cupertino.dart';

class BMICalculator {
  BMICalculator({@required this.height, @required this.weight}) {
    _bmi = (weight / (height / 100 * height / 100));
  }

  final double height;
  final double weight;
  double _bmi;

  String getBMI() => _bmi.toStringAsFixed(1);

  String getResult() => _bmi >= 55
      ? 'HYPER OBESE'
      : _bmi >= 45
          ? 'SUPER OBESE'
          : _bmi >= 35
              ? 'MORBIDLY OBESE'
              : _bmi >= 30
                  ? 'OBESE'
                  : _bmi >= 25
                      ? 'OVERWEIGHT'
                      : _bmi > 18.5 ? 'NORMAL' : 'UNDERWEIGHT';

  String getMemo() => _bmi >= 55
      ? 'You have attained the most extreme level of obesity possible. The gravitational pull of your mass is perceptible by others.'
      : _bmi >= 30
          ? 'Obesity is one of the leading preventable causes of death. Healthy lifestyle changes could save your life.'
          : _bmi >= 25
              ? 'Consider a healthier diet and getting more exercise.'
              : _bmi > 18
                  ? 'Your weight is normal for your height.'
                  : 'Consider eating more food.';
}
