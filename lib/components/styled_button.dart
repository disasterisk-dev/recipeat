import 'package:flutter/material.dart';
import 'package:recipeat/theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.onPressed, required this.child});

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brand,
        foregroundColor: AppColors.inverse,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Padding(padding: const EdgeInsets.all(8), child: child),
    );
  }
}
