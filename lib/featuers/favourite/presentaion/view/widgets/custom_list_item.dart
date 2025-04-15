import 'package:flutter/material.dart';
import 'package:our_market/featuers/favourite/presentaion/view/widgets/custom_cart_item.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const CustomCardItem();
        });
  }
}
