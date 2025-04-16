import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/product_detalse_view.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => navigatorTo(context, const ProductDetalseView()),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  width: screenWidth * 4, // 30% من عرض الشاشة
                  height: screenHeight * 0.3,
                  imageUrl:
                      "https://ichef.bbci.co.uk/news/1024/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp",

                  errorWidget: const Icon(Icons.error),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(4.0),
                child: const Row(
                  children: [
                    TitelTextWidget(text: "TitelProduct"),
                    Spacer(),
                    CustomIconButton(icon: Icons.heart_broken),
                    CustomIconButton(icon: Icons.delete),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const TitelTextWidget(text: r"$234"),
                    const TitelTextWidget(text: r"$234"),
                    const Spacer(),
                    CustomElevateGenaric(
                      onPressed: () {},
                      text: "BuyNow",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
