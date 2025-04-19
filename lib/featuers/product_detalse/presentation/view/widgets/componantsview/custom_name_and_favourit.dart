import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';

class CustmnameandFavourit extends StatelessWidget {
  const CustmnameandFavourit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TitelTextWidget(text: "productName"),
        CustomIconButton(
          icon: Icons.favorite,
          onPressed: () {},
        )
      ],
    );
  }
}
