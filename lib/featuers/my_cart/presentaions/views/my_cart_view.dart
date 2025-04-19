import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/widgets/custom_buttom_cheet.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/widgets/custom_my_card.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: const CustomButtonCheet(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const TitelTextWidget(text: "Your Bag"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // CustomMyCart(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const CustomMyCart();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
