import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../functions/responsiveSize.dart';
import '../pages/input_page.dart';
import '../pages/output_page.dart';

class smallButton_widget extends StatelessWidget {
  final String _txt;
  final IconData _icon;
  final VoidCallback _fun;

  smallButton_widget(this._txt, this._icon, this._fun);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kColorDarkPurple,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: _fun,
        child: Container(
          width: responsiveSize(outSize.width * 0.4375, 0, 290),
          height: responsiveSize(outSize.height * 0.08, 0, 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _txt,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(width: thisSize.width * 0.01),
              Icon(
                _icon,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
