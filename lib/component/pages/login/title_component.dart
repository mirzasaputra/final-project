import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleComponent extends StatelessWidget {
  String title;
  String subtitle;
  TextAlign? textAlign;
  TitleComponent({
    required this.title,
    required this.subtitle,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      Text(subtitle, textAlign: textAlign)
    ]);
  }
}
