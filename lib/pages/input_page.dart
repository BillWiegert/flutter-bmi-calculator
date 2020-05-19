import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/my_card.dart';
import '../components/icon_content.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

enum Units {
  SI,
  US,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Units activeUnits = Units.SI;
  static double cmHeight = 180.0;
  static double kgWeight = 60.0;
  static int getInches() => (cmHeight * 0.393701 % 12).floor();
  static int getFeet() => (cmHeight * 0.393701 / 12).floor();
  static int getPounds() => (kgWeight * 2.20462).floor();
  int age = 35;

  void toggleActiveUnits(Units units) {
    setState(() {
      activeUnits = (units == activeUnits) ? null : units;
    });
  }

  Color getUnitsCardColor(Units units) {
    return activeUnits == units ? kActiveCardColor : kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyCard(
                      onPress: () {
                        toggleActiveUnits(Units.SI);
                      },
                      color: getUnitsCardColor(Units.SI),
                      child: IconContent(
                        icon: Icons.language,
                        label: 'SI Units',
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      onPress: () {
                        toggleActiveUnits(Units.US);
                      },
                      color: getUnitsCardColor(Units.US),
                      child: IconContent(
                        icon: FontAwesomeIcons.flagUsa,
                        label: 'US Units',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          activeUnits == Units.SI
                              ? cmHeight.toStringAsFixed(0)
                              : '${getFeet()}\' ${getInches()}\"',
                          style: kNumberTextStyle,
                        ),
                        Text(
                          activeUnits == Units.SI ? 'cm' : '',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: cmHeight.toDouble(),
                        min: 120.0,
                        max: 260.0,
                        onChanged: (double val) {
                          setState(() {
                            cmHeight = val.roundToDouble();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                activeUnits == Units.SI
                                    ? kgWeight.toStringAsFixed(0)
                                    : getPounds().toStringAsFixed(0),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                activeUnits == Units.SI ? 'kg' : 'lbs',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: kgWeight > 0
                                    ? () {
                                        setState(() {
                                          activeUnits == Units.SI
                                              ? kgWeight--
                                              : kgWeight -= 0.453592;
                                          kgWeight =
                                              kgWeight < 0 ? 0 : kgWeight;
                                        });
                                      }
                                    : null,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    activeUnits == Units.SI
                                        ? kgWeight++
                                        : kgWeight += 0.453592;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      color: kActiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MyCard(
              color: kBottomContainerColor,
              onPress: () {
                BMICalculator calc =
                    BMICalculator(height: cmHeight, weight: kgWeight);
                Navigator.pushNamed(
                  context,
                  '/results',
                  arguments: {
                    'bmi': calc.getBMI(),
                    'memo': calc.getMemo(),
                    'resultText': calc.getResult()
                  },
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: kLargeButtonTextStyle,
                  ),
                ),
                height: kBottomContainerHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
