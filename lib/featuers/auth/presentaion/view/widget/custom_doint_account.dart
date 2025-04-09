import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustonDontAccount extends StatelessWidget {
  const CustonDontAccount({
    super.key,
    required this.text,
    required this.subtitel,
    this.onpressed,
  });
  final String text, subtitel;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SubtitelTextWidget(
          text: text,
          fontWeight: FontWeight.bold,
        ),
        GestureDetector(
            onTap: onpressed,
            child: TitelTextWidget(
              text: subtitel,
              color: AppColors.ksignUp,
            ))
      ],
    );
  }
}
