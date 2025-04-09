import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustonDontAccount extends StatelessWidget {
  const CustonDontAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SubtitelTextWidget(
          text: "Don't have an account ?",
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
            onTap: () {},
            child: const TitelTextWidget(
              text: " Sign Up",
              color: AppColors.ksignUp,
            ))
      ],
    );
  }
}
