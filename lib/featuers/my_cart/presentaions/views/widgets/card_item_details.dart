import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/widgets/cart_item_action.dart';

class CardItemDetalis extends StatelessWidget {
  const CardItemDetalis({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitelTextWidget(
          text: "Product Title",
        ),
        const SizedBox(height: 4),
        const SubtitelTextWidget(
          text: "Color: Black | Size: M",
          color: AppColors.kgrey,
          fontSize: 15,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            TitelTextWidget(
              text: "\$456.56",
              color: AppColors.kprice,
              fontSize: 19,
            ),
            const SizedBox(width: 8),
            const SubtitelTextWidget(
              text: "\$600.00",
              fontSize: 16,
              decoration: TextDecoration.lineThrough,
              color: AppColors.kgrey,
            ),
          ],
        ),
        const SizedBox(height: 12),
        CardItemAction()
      ],
    );
  }
}
