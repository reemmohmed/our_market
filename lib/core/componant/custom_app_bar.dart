import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CustomIconButton(
            icon: Ionicons.notifications_outline,
          ),
          const CustomIconButton(
            icon: Ionicons.search_outline,
          ),
          const Spacer(),
          Image.asset(
            AppAsset.imagebanner,
            width: 60,
            height: 40,
          ),
          TitelTextWidget(
            text: "OurMarket",
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontSize: 25,
          ),
        ],
      ),
    );
  }
}
