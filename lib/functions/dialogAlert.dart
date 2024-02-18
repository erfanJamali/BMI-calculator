import 'package:flutter/material.dart';

Widget shareTable(context, String _txt, IconData _icon, bool isLast) {
  return InkWell(
    onTap: (){},
    child: Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 5),
            Text(_txt, style: const TextStyle(fontSize: 30),),
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
    shareTable(context, "WhatsApp", Icons.emoji_nature_sharp, false),
    shareTable(context, "Tinder", Icons.whatshot_sharp, false),
    shareTable(context, "Instagram", Icons.install_desktop, false),
    shareTable(context, "X", Icons.sunny, false),
    shareTable(context, "FaceBook", Icons.facebook, false),
    shareTable(context, "Telegram", Icons.telegram, false),
    shareTable(context, "SMS", Icons.sms, true),
  ];
  //
  return showAboutDialog(
    context: context,
    applicationName: "BMI calculator",
    applicationIcon: const Icon(Icons.share_rounded),
    children: teblesList,
  );
}
