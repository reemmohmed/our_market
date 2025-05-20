import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';

class CustomTotalrating extends StatelessWidget {
  const CustomTotalrating({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SubtitelTextWidget(
            text: text,
            fontSize: 20,
          ),
          const Icon(
            Icons.star_rounded,
            color: Colors.orange,
            size: 29,
          )
        ],
      ),
    );
  }
}
