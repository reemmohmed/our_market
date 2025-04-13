import 'package:flutter/material.dart';
import 'package:our_market/core/componant/custom_text_search.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/widgets/text_app_shammer.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/catogery_list.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/recentrey_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextSeach(
                hitText: "Search",
              ),
              const SizedBox(
                height: 10,
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  AppAsset.imagebanner,
                  fit: BoxFit.fill,
                ),
              ),
              const TextAppShammer(lable: "Catogeres"),
              const CatogetyList(),
              const TextAppShammer(lable: "Recentry products"),
              const Recentreyproduct(),
            ],
          ),
        ),
      ),
    );
  }
}
