import 'package:flutter/material.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/widgets/card_item_details.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/widgets/custom_iamge_cart.dart';

class CustomMyCart extends StatelessWidget {
  const CustomMyCart({
    super.key,
    required this.product,
    required this.onRemove,
  });
  final ProductModel product;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            CustomImageCart(
              imageUrl: product.imageUrl ??
                  "https://ichef.bbci.co.uk/news/1024/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp",
            ),
            const SizedBox(width: 12),

            // تفاصيل المنتج
            Expanded(
                child: CardItemDetalis(
              onRemove: onRemove,
              product: product,
            )),
          ],
        ),
      ),
    );
  }
}
