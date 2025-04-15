import 'package:flutter/material.dart';

import 'custom_list_all_product_store.dart';

class StoreViewBody extends StatelessWidget {
  const StoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [CustomListAllproductStore()],
      ),
    );
  }
}
