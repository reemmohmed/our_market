import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustomDetalsPrice extends StatelessWidget {
  const CustomDetalsPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const TitelTextWidget(
          text: "Price : ",
        ),
        TitelTextWidget(
          text: r" $123",
          color: AppColors.kprice,
        ),
      ],
    );
  }
}
