import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback pressFunction;
  final Widget child;
  final Color backgroundColor;

  const BaseButton({
    super.key,
    required this.pressFunction,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: pressFunction,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
      child: child,
    );
  }
}
