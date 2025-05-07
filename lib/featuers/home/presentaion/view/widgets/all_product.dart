import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/componant/shimmer_iamge.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/product_detalse_view.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({
    super.key,
    required this.product,
    this.onPressed,
    required this.isFavourite,
  });
  final ProductModel product;
  final void Function()? onPressed;
  final bool isFavourite;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => navigatorTo(
          context,
          ProductDetalseView(
            product: product,
          ),
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: ShimmerImage(
                      imageUrl: product.imageUrl ??
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
                    child: SubtitelTextWidget(
                      text: "${product.sale} OFF",
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
                        TitelTextWidget(
                          text: product.productName ?? "",
                          fontSize: 25,
                        ),
                        IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            isFavourite
                                ? Ionicons.heart
                                : Ionicons.heart_outline,
                            size: 30,
                            color: isFavourite
                                ? AppColors.ksignUp
                                : Theme.of(context).colorScheme.onSurface,
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
                        Column(
                          children: [
                            SubtitelTextWidget(
                              text: "${product.price}",
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            SubtitelTextWidget(
                              text: product.oldPrice ?? "",
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
