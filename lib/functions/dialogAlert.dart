import 'package:bmi_calculator/functions/showSnack.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget shareTable(context, String _txt, IconData _icon, {bool isLast = false}) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
      showSnake(context, "your BMI shared on $_txt");
    },
    child: Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 5),
            Text(
              _txt,
              style: const TextStyle(fontSize: 30),
            ),
            const Spacer(),
            Icon(_icon, size: 30),
            const SizedBox(width: 5),
          ],
        ),
        const SizedBox(height: 10),
        if (!isLast) ...{
          const Divider(
            height: 3,
            color: Colors.black,
          ),
        },
      ],
    ),
  );
}

void dialogAlert(context) {
  //
  List<Widget> teblesList = [
    shareTable(context, "WhatsApp", FontAwesomeIcons.whatsapp),
    shareTable(context, "Tinder", FontAwesomeIcons.fire),
    shareTable(context, "Instagram", FontAwesomeIcons.instagram),
    shareTable(context, "X", FontAwesomeIcons.twitter),
    shareTable(context, "FaceBook", FontAwesomeIcons.facebook),
    shareTable(context, "Telegram", FontAwesomeIcons.telegram),
    shareTable(context, "SMS", FontAwesomeIcons.commentSms, isLast: true),
  ];
  //
  return showAboutDialog(
    context: context,
    applicationName: "BMI calculator",
    applicationIcon: const Icon(Icons.share_rounded),
    children: teblesList,
  );
}
