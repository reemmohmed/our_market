import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/text_app_shammer.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/catogery_list.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/recentrey_product.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextAppShammer(lable: "Catogeres"),
          const CatogetyList(),
          const SizedBox(
            height: 7.5,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const AllProduct();
            },
          )
        ],
      ),
    );
  }
}
