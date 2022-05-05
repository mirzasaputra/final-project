import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonListComponent extends StatelessWidget {
  String title;
  IconData icon;
  GestureTapCallback? onTap;

  ButtonListComponent({
    required this.title,
    required this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey.shade300, width: 1.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
