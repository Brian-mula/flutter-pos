import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const CustomeText(
      {super.key,
      this.size = 15,
      this.color = Colors.black54,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
