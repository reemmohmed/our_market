import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomImageCart extends StatelessWidget {
  const CustomImageCart({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: screenWidth * 0.3,
        height: screenHeight * 0.2,
        child: FancyShimmerImage(
          boxFit: BoxFit.cover,
          imageUrl: imageUrl,
          errorWidget: const Icon(Icons.error, color: Colors.red),
        ),
      ),
    );
  }
}
