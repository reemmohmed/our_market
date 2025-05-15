import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustomButtomBuy extends StatelessWidget {
  const CustomButtomBuy({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 16)),
          onPressed: onPressed,
          child: const TitelTextWidget(text: "BuyNow")),
    );
  }
}
