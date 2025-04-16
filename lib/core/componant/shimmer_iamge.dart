import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return FancyShimmerImage(
      boxFit: BoxFit.cover,
      width: screenWidth * 4, // 30% من عرض الشاشة
      height: screenHeight * 0.3,
      imageUrl: imageUrl,
      errorWidget: const Icon(Icons.error),
    );
  }
}
