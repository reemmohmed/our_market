import 'package:flutter/material.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/my_cart_view.dart';

class CustomButtomBuy extends StatelessWidget {
  const CustomButtomBuy({
    super.key,
  });

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
          onPressed: () {
            navigatorTo(context, const MyCartView());
          },
          child: const TitelTextWidget(text: "BuyNow")),
    );
  }
}
