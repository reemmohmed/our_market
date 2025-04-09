import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:shimmer/shimmer.dart';

class TextAppShammer extends StatelessWidget {
  const TextAppShammer({
    super.key,
    required this.lable,
    this.fontSize = 25,
  });
  final String lable;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        period: const Duration(seconds: 7),
        baseColor: Colors.grey,
        highlightColor: Colors.purple,
        child: TitelTextWidget(
          text: lable,
          fontSize: fontSize,
        ));
  }
}
