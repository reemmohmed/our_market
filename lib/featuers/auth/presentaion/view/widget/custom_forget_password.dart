import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: const TitelTextWidget(
          text: "Forget password?",
          fontSize: 18,
          color: AppColors.kprimaryColoblue,
        ),
      ),
    );
  }
}
