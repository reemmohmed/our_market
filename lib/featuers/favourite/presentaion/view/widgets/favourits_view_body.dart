import 'package:flutter/material.dart';
import 'package:our_market/featuers/favourite/presentaion/view/widgets/custom_list_item.dart';

class FavouritsViewBody extends StatelessWidget {
  const FavouritsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [CustomListItem()],
      ),
    );
  }
}
