import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/widgets/app_colors.dart';

class CustomTextSeach extends StatelessWidget {
  const CustomTextSeach({
    super.key,
    required this.hitText,
  });
  final String? hitText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        prefix: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: const Icon(
            Ionicons.search,
            size: 25,
          ),
        ),
        hintText: "$hitText",
        hintStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.darkScaffold),
        filled: true,
        fillColor: Colors.grey,
      ),
    );
  }
}
