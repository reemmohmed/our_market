import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/componant/custom_text_search.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.onPressed,
    this.controller,
  });
  final void Function()? onPressed;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextSeach(
              onTap: onPressed,
              hitText: "Search for favourt",
              controller: controller,
            ),
          ),
          // CustomIconButton(
          //   onPressed: onPressed,
          //   icon: Ionicons.search_outline,
          // ),
          const SizedBox(
            width: 12,
          ),

          // const Spacer(),
          Image.asset(
            AppAsset.imagebanner,
            width: 40,
            height: 40,
          ),
          TitelTextWidget(
            text: "OurMarket",
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
