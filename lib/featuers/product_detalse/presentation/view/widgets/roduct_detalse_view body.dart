import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/product_detalse/mange/DotesImage/dotes_image_cubit.dart';

import 'package:our_market/featuers/product_detalse/presentation/view/widgets/product_dots_indecator.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/product_image_saroursel.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة الصور التي سيتم تمريرها إلى RoductDetalseViewBody
    final List<String> imageUrls = [
      "https://ichef.bbci.co.uk/news/1024/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp",
      "https://ichef.bbci.co.uk/news/1024/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp",
      "https://ichef.bbci.co.uk/news/1024/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp",
      // أضف المزيد من الصور هنا
    ];

    return BlocProvider(
      create: (_) => DotesImageCubit(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ProductImageCarousel(imageUrls: imageUrls),
            const SizedBox(height: 12),
            ProductDotsIndicator(imageUrls: imageUrls),
            const SizedBox(
              height: 9,
            ),
            Row(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitelTextWidget(text: "productName"),
                CustomIconButton(
                  icon: Icons.favorite,
                  onPressed: () {},
                )
              ],
            ),
            const SubtitelTextWidget(
                maxLines: 4,
                text:
                    "productNameproductNameproductNameproductNameproductNameproductNameproductNameproductName"),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}
