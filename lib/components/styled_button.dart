import 'package:flutter/material.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:recipeat/theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });

  final void Function() onPressed;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.brand,
        foregroundColor: AppColors.inverse,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 4,
          children: [if (icon != null) Icon(icon, size: 24), ButtonText(label)],
        ),
      ),
    );
  }
}
