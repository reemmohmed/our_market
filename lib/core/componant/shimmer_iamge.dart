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
    return FancyShimmerImage(
      boxFit: BoxFit.cover,
      width: double.infinity,
      imageUrl: imageUrl,
      errorWidget: const Icon(Icons.error),
    );
  }
}
