import 'package:flutter/material.dart';

class CornerButton extends StatelessWidget {
  const CornerButton({super.key, required this.onPressed, required this.child});

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 8,
      child: FloatingActionButton(onPressed: onPressed, child: child),
    );
  }
}
