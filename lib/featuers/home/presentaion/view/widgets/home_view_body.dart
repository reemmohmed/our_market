import 'package:flutter/material.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/widgets/text_app_shammer.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product_list.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/catogery_list.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: const TextAppShammer(lable: "Catogeres"),
          ),
          const CatogetyList(),
          const SizedBox(
            height: 7.5,
          ),
          AllProductList(
            message1Titel: "No Items Available",
            message2subtitel: "There are currently no products in this categor",
            emptyImagePath: AppAsset.nodata,
          )
        ],
      ),
    );
  }
}
