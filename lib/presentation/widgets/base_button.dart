import 'package:flutter/material.dart';

class baseButton extends StatelessWidget {
  final VoidCallback pressFunction;
  final String label;
  final dynamic backgroundColor;
  const baseButton({super.key, required this.pressFunction, required this.label, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: pressFunction,
      style: ButtonStyle(
        backgroundColor: backgroundColor
      ),
      child: Text(label, style: TextStyle(fontSize: 12)),
    );
  }
}
