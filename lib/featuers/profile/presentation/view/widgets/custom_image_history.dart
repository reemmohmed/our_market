import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomImageHistory extends StatelessWidget {
  const CustomImageHistory({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.16,
      width: screenHeight * 0.27,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: FancyShimmerImage(
          boxFit: BoxFit.cover,
          width: screenWidth * .4, // 30% من عرض الشاشة
          height: screenHeight * 0.1,
          imageUrl: imageUrl,
          errorWidget: const Icon(Icons.error),
        ),
      ),
    );
  }
}
