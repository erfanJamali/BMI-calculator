import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../functions/responsiveSize.dart';
import '../pages/input_page.dart';

int ageVal = 21;
int weightVal = 78;

class numbericUpDown_widget extends StatefulWidget {
  final String _title;
  final bool _isWeight;

  const numbericUpDown_widget(this._title, this._isWeight);

  @override
  State<numbericUpDown_widget> createState() => _numbericUpDown_widgetState();


  int get weight => weightVal;
}

class _numbericUpDown_widgetState extends State<numbericUpDown_widget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: responsiveSize(MediaQuery.of(context).size.width * 0.45, 200, 350),
        height: responsiveSize(MediaQuery.of(context).size.height * 0.25, 180, 330),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kColorBlue,
        ),
        child: Column(
          children: [
            Text(
              widget._title,
              style: TextStyle(
                  fontFamily: "myFont", fontSize: 20, color: kColorWhite),
            ),
            Text(
              (widget._isWeight) ? weightVal.toString() : ageVal.toString(),
              style: const TextStyle(
                  fontFamily: "myFont", fontSize: 60, color: Colors.white),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                circleUpDown(false),
                SizedBox(width: thisSize.width * 0.07),
                circleUpDown(true),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget circleUpDown(bool doPlus) {
    return Material(
      color: kColorWhite,
      borderRadius: BorderRadius.circular(42.5),
      child: InkWell(
          borderRadius: BorderRadius.circular(42.5),
          splashColor: kColorLightPurple,
          onTap: () {
            setState(() {
              if (doPlus) {
                if (widget._isWeight) {
                  if(weightVal <= 648) {
                    weightVal++;
                  }
                } else if (!widget._isWeight) {
                  if(ageVal <= 121) {
                    ageVal++;
                  }
                }
              } else if (!doPlus) {
                  if (widget._isWeight) {
                    if(weightVal >= 1) {
                      weightVal--;
                    }
                  } else if (!widget._isWeight) {
                    if(ageVal >=1) {
                      ageVal--;
                    }
                  }
              }
            });
          },
          child: Container(
            width: 85,
            height: 85,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Icon(
              doPlus ? Icons.add_rounded : Icons.horizontal_rule_rounded,
              size: 50,
              color: kColorBlue,
            ),
          )),
    );
  }
}
