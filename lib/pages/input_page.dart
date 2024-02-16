import 'dart:js_util';

import 'package:bmi_calculator/conts/colors.dart';
import 'package:bmi_calculator/functions/responsiveSize.dart';
import 'package:bmi_calculator/pages/output_page.dart';
import 'package:bmi_calculator/widgets/heightSlider_widget.dart';
import 'package:bmi_calculator/widgets/numbericUpDown_widget.dart';
import 'package:bmi_calculator/widgets/row_widget.dart';
import 'package:bmi_calculator/widgets/selectGender_widget.dart';
import 'package:flutter/material.dart';

//
late Size thisSize;
bool doClick = false;
// false => cm || true => foot
// bool heightBase = false;
//

class input_page extends StatefulWidget {
  const input_page({super.key});

  @override
  State<input_page> createState() => _input_pageState();
}

class _input_pageState extends State<input_page> {
  @override
  Widget build(BuildContext context) {
    //
    thisSize = MediaQuery.of(context).size;
    //
    return Scaffold(
      backgroundColor: kColorDarkBlue,
      appBar: AppBar(
        backgroundColor: kColorDarkBlue,
        elevation: 10,
        centerTitle: true,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              color: kColorWhite, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.add, color: kColorWhite, size: 50),
      ),
      body: Column(
        children: [
          responsiveHeight(),
          row_widget(
            selectGender_widget(
                "FEMALE", Icons.female_rounded, genderClickFun, false),
            selectGender_widget(
                "MALE", Icons.male_rounded, genderClickFun, true),
          ),
          responsiveHeight(),
          heightSlider_widegt(),
          responsiveHeight(),
          const row_widget(
            numbericUpDown_widget("WEIGHT", true),
            numbericUpDown_widget("AGE", false),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                ModalBottomSheetRoute(
                    builder: (context) => const output_page(),
                    isScrollControlled: false),
              );
            },
            child: Container(
              width: responsiveSize(thisSize.width, 200, thisSize.width),
              height: responsiveSize(thisSize.height * 0.1, 100, 150),
              color: kColorDarkPurple,
              child: const Center(
                child: Text(
                  "C A L C U L A T E",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void genderClickFun() {
    setState(() {
      if (doClick) {
        doClick = false;
        currentSliderValue = 160;
      } else if (!doClick) {
        doClick = true;
        currentSliderValue = 175;
      }
    });
  }

  SizedBox responsiveHeight() {
    return SizedBox(height: thisSize.height * 0.05);
  }
}
