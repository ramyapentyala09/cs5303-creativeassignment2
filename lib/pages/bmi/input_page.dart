import 'package:assignmenttwo/pages/bmi/Bottom_button.dart';
import 'package:assignmenttwo/pages/bmi/circle_button.dart';
import 'package:assignmenttwo/pages/bmi/gender_widget.dart';
import 'package:assignmenttwo/pages/bmi/my_card_view.dart';
import 'package:assignmenttwo/pages/bmi/results_page.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculator_brain.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  static String routeName = 'bmi_screen';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = KInactiveCardColor;
  Color femaleCardColor = KInactiveCardColor;

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: MyCardView(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        myColor: selectedGender == Gender.male
                            ? kActiveCardColor
                            : KInactiveCardColor,
                        cardChild: GenderWidget(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: MyCardView(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        myColor: selectedGender == Gender.female
                            ? kActiveCardColor
                            : KInactiveCardColor,
                        cardChild: GenderWidget(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: MyCardView(
                  myColor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kGenderTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kHeightTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kGenderTextStyle,
                          ),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: MyCardView(
                        myColor: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('WEIGHT',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              weight.toString(),
                              style: kHeightTextStyle,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleButton(
                                  onClick: () {
                                    setState(() {
                                      weight--;
                                      print(weight.toString());
                                    });
                                  },
                                  iconData: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                CircleButton(
                                  onClick: () {
                                    setState(() {
                                      weight++;
                                      print(weight.toString());
                                    });
                                  },
                                  iconData: FontAwesomeIcons.plus,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MyCardView(
                        myColor: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              age.toString(),
                              style: kHeightTextStyle,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleButton(
                                  onClick: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                CircleButton(
                                  onClick: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.plus,
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
              BottomButtonWidget(
                title: 'CALCULATE',
                onclick: () {
                  CalculatorBrain cal =
                      CalculatorBrain(height: height, weight: weight);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                              bmiResults: cal.calculateBMI(),
                              resultsText: cal.getResults(),
                              interpretation: cal.getInterpretation())));
                },
              )
            ],
          ),
        ));
  }
}
