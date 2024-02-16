import 'package:flutter/material.dart';

import '../pages/input_page.dart';

class row_widget extends StatelessWidget {

  final Widget _widget0;
  final Widget _widget1;

  const row_widget(this._widget0,this._widget1);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _widget0,
        SizedBox(width: thisSize.width * 0.025),
        _widget1,
      ],
    );
  }
}
