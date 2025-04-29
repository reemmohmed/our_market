import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/home/data/product_model.dart';

class CustmnameandFavourit extends StatelessWidget {
  const CustmnameandFavourit({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitelTextWidget(text: "${product.productName}"),
            CustomIconButton(
              icon: Icons.favorite,
              onPressed: () {},
            ),
          ],
        ),
        SubtitelTextWidget(maxLines: 4, text: "${product.productDescraption}"),
      ],
    );
  }
}
