import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const CustomeText({super.key, this.textStyle, required this.text});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Text(text, style: textStyle ?? theme.textTheme.bodyLarge);
  }
}
