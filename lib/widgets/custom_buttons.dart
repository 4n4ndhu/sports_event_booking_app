import 'package:flutter/material.dart';

class customeButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  void Function()? onPressedButton;

  customeButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    required this.onPressedButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            onPressed: onPressedButton,
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium)));
  }
}
