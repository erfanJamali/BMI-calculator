import 'package:bmi_calculator/conts/colors.dart';
import 'package:flutter/material.dart';

import '../functions/responsiveSize.dart';
import '../pages/input_page.dart';

class heightSlider_widegt extends StatefulWidget {
  @override
  State<heightSlider_widegt> createState() => _heightSlider_widegtState();

  double get getHeight => _currentSliderValue;

  //
  void setHeight(double newVal) {
    _currentSliderValue = newVal;
  }
  //
}

late double _currentSliderValue;

class _heightSlider_widegtState extends State<heightSlider_widegt> {
  @override
  void initState() {
    super.initState();
    //
    _currentSliderValue = 160;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: kColorBlue,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          setState(() {
            // if (heightBase) {
            //   heightBase = false;
            //   _currentSliderValue=_currentSliderValue / 0.0328084;
            // } else if (!heightBase) {
            //   heightBase = true;
            //   _currentSliderValue= _currentSliderValue *  0.0328084;
            // }
          });
        },
        child: Container(
          width: responsiveSize(thisSize.width * 0.9, 400, 700) +
              (thisSize.width * 0.025),
          height: responsiveSize(thisSize.height * 0.2, 180, 330),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kColorBlue,
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontFamily: "myFont",
                      fontSize: 20,
                      color: kColorWhite,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: thisSize.height * 0.008),
                    child: Text(
                      _currentSliderValue.round().toString() + " CM",
                      style: const TextStyle(
                        fontFamily: "myFont",
                        fontSize: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Slider(
                    value: _currentSliderValue,
                    activeColor: kColorDarkPurple,
                    min: 40,
                    max: 300,
                    divisions: 260,
                    overlayColor: MaterialStateProperty.all(kColorLightPurple),
                    thumbColor: kColorDarkPurple,
                    inactiveColor: kColorDarkBlue,
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Text(
// "CM",
// style: TextStyle(
// fontFamily: "myFont",
// fontSize: 20,
// color: kColorWhite,
// ),
// ),
