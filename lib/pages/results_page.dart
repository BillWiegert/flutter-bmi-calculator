import '../components/my_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: MyCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    args['resultText'],
                    style: kResultTextStyle,
                  ),
                  Text(
                    args['bmi'],
                    style: kBMITextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: MyCard(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    args['memo'],
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ),
              ),
            ),
          ),
          MyCard(
            color: kBottomContainerColor,
            onPress: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
