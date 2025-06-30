import 'package:flutter/material.dart';
import 'package:recipeat/theme.dart';

class StyledTextInput extends StatelessWidget {
  const StyledTextInput({
    super.key,
    required this.controller,
    required this.validator,
    required this.label,
    this.inputType = TextInputType.text,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final String? Function(String?) validator;
  final String label;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: AppColors.boldMuted),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.all(8),
      ),
      validator: validator,
    );
  }
}
