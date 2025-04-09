import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.lableText,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.obscuringCharacter = ".",
  });
  final String? lableText;
  final String obscuringCharacter;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      validator: (valu) {
        if (valu == null || valu.isEmpty) {
          return "this failed is requierd";
        }
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Text(
            lableText ?? '',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.darkScaffold),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.grey, width: 2)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
