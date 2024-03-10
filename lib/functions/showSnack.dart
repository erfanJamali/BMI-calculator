
import 'package:flutter/material.dart';

void showSnake(context, String _txt) {
  //
  SnackBar snack = SnackBar(content: Text(_txt));
  //
  ScaffoldMessenger.of(context).showSnackBar(snack);
  //
}
