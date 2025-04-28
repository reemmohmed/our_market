import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';

class CustomTotalrating extends StatelessWidget {
  const CustomTotalrating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SubtitelTextWidget(
            text: "3",
            fontSize: 20,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.orange,
            size: 29,
          )
        ],
      ),
    );
  }
}
