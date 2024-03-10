import 'package:bmi_calculator/const/colors.dart';
import 'package:bmi_calculator/functions/dialogAlert.dart';
import 'package:bmi_calculator/functions/responsiveSize.dart';
import 'package:bmi_calculator/functions/showSnack.dart';
import 'package:bmi_calculator/widgets/row_widget.dart';
import 'package:bmi_calculator/widgets/smallButton_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class output_page extends StatefulWidget {
  @override
  State<output_page> createState() => _output_pageState();

  double _userHeight;
  final int _userWeight;

  output_page(this._userHeight, this._userWeight);
}

//
late Size outSize;
//
late double _userBMINumber;
late int _userBMIZone;
late Color _userBMIColor;
List<String> _userBMITitle = ["LOW", "NORMAL", "HIGH"];
List<String> _userBMIAdvice = [
  "Try eat more with doctor advice.",
  "That is good!\rkeep it normal.",
  "Try eat less with doctor advice."
];
//

class _output_pageState extends State<output_page> {
  @override
  void initState() {
    super.initState();
    //
    widget._userHeight = widget._userHeight / 100;
    _userBMINumber =
        widget._userWeight / (widget._userHeight * widget._userHeight);
    //
    if (_userBMINumber >= 25.0) {
      _userBMIZone = 2;
    } else if (_userBMINumber <= 18.5) {
      _userBMIZone = 0;
    } else {
      _userBMIZone = 1;
    }

    //
    _userBMIColor = (_userBMIZone == 0)
        ? Colors.yellow
        : (_userBMIZone == 1)
            ? CupertinoColors.activeGreen
            : Colors.red;
    //
  }

  @override
  Widget build(BuildContext context) {
    //
    outSize = MediaQuery.of(context).size;
    //
    return Container(
        width: outSize.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28), topRight: Radius.circular(28)),
            color: kColorBlue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: outSize.height * 0.02),
            Container(
              height: 3,
              width: responsiveSize(outSize.width / 3, 50, 250),
              decoration: BoxDecoration(
                color: kColorWhite,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
            SizedBox(height: outSize.height * 0.05),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: ((outSize.width - outSize.width * 0.9) / 2) + 28,
                    ),
                    const Text(
                      "normal BMI for you: ${25.0 + 18.5 / 2}",
                      style: TextStyle(color: Colors.white70, fontSize: 20),
                    ),
                  ],
                )),
            Container(
              width: responsiveSize(outSize.width * 0.9, 0, 600),
              height: responsiveSize(outSize.height * 0.2, 0, 300),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: kColorDarkBlue),
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  SizedBox(
                    width: responsiveSize((outSize.width * 0.9) / 2, 100, 300),
                    child: Column(
                      children: [
                        const SizedBox(height: 14),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("${_userBMITitle[_userBMIZone]} BMI",
                              style:
                                  TextStyle(color: kColorWhite, fontSize: 20)),
                        ),
                        const SizedBox(height: 28),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: _userBMIAdvice[_userBMIZone],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    (_userBMINumber.toString().contains('.0'))
                        ? _userBMINumber.round().toString()
                        : _userBMINumber.toStringAsFixed(1),
                    style: TextStyle(color: _userBMIColor, fontSize: 80),
                  ),
                  const Spacer()
                ],
              ),
            ),
            const Spacer(),
            row_widget(
              smallButton_widget("SAVE", Icons.save, saveBtnClickFun),
              smallButton_widget("SHARE", Icons.share, shareBtnClickFun),
            ),
            SizedBox(height: outSize.height * 0.02),
            Material(
              color: kColorDarkPurple,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: responsiveSize(outSize.width * 0.9, 0, 600),
                  height: responsiveSize(outSize.height * 0.1, 0, 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text(
                    "re-calculate",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      );
  }

  void saveBtnClickFun() {
    showSnake(context, "BMI has been saved");
  }

  void shareBtnClickFun() {
    dialogAlert(context);
  }
}
