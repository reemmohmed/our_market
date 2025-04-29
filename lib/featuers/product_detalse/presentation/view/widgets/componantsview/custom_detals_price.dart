import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/home/data/product_model.dart';

class CustomDetalsPrice extends StatelessWidget {
  const CustomDetalsPrice({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const TitelTextWidget(
          text: "Price : ",
        ),
        TitelTextWidget(
          text: " ${product.price}",
          color: AppColors.kprice,
        ),
      ],
    );
  }
}
