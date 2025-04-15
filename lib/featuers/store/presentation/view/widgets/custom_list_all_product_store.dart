import 'package:flutter/material.dart';
import 'package:our_market/featuers/store/presentation/view/widgets/custom_all_product_store.dart';

class CustomListAllproductStore extends StatelessWidget {
  const CustomListAllproductStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const CustomAllProductStore();
        });
  }
}
