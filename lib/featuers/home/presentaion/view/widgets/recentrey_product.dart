import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/componant/shimmer_iamge.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/product_detalse_view.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({
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
              Stack(
                children: [
                  const ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: ShimmerImage(
                      imageUrl:
                          "https://ichef.bbci.co.uk/news/1024/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp",
                    ),
                  ),
                  Positioned(
                      child: Container(
                    alignment: Alignment.center,
                    height: 44,
                    width: 88,
                    decoration: const BoxDecoration(
                      color: AppColors.kprimaryColoblue,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const SubtitelTextWidget(
                      text: "10% OFF",
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TitelTextWidget(
                          text: "Product Three",
                          fontSize: 25,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Ionicons.heart_outline,
                            size: 30,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          children: [
                            SubtitelTextWidget(
                              text: r"$1233",
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            SubtitelTextWidget(
                              text: r"$1233",
                              fontSize: 20,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kblue,
                            elevation: 2,
                          ),
                          onPressed: () {},
                          child: TitelTextWidget(
                            text: "Buy Now",
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ],
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
