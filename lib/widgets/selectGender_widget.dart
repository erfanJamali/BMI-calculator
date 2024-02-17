
import 'package:bmi_calculator/conts/colors.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../functions/responsiveSize.dart';

class selectGender_widget extends StatelessWidget {

  final String _txt;
  final IconData _icon;
  final VoidCallback _fun;
  final bool _gender;

  const selectGender_widget(this._txt, this._icon, this._fun, this._gender);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (!doClick && !_gender)
          ? kColorWhite
          : (doClick && _gender)
          ? kColorWhite
          : kColorBlue,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: _fun,
        splashColor: (_gender) ? CupertinoColors.systemBlue : Colors.pinkAccent,
        child: Container(
          width: responsiveSize(thisSize.width * 0.45, 200, 350),
          height: responsiveSize(thisSize.height * 0.2, 180, 330),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(_icon,
                  color: (!doClick && !_gender)
                      ? kColorDarkBlue
                      : (doClick && _gender)
                      ? kColorDarkBlue
                      : kColorWhite,
                  size: responsiveSize(thisSize.width * 0.25, 100, 120)),
              Text(
                _txt,
                style: TextStyle(
                  fontFamily: "myFont",
                  fontSize: 40,
                  color: (!doClick && !_gender)
                      ? kColorDarkBlue
                      : (doClick && _gender)
                      ? kColorDarkBlue
                      : kColorWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}