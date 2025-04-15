import 'package:flutter/material.dart';
import 'package:our_market/core/AppServer/show_dialog.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/widgets/custom_icon_my_cart.dart';

class CardItemAction extends StatelessWidget {
  const CardItemAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // أزرار الكمية
        Row(
          children: [
            CustomIconMyCart(
              icon: Icons.remove_circle_outline,
              onPressed: () {},
              color: AppColors.kiconcart,
            ),
            const SubtitelTextWidget(text: "1", fontSize: 16),
            CustomIconMyCart(
              icon: Icons.add_circle_outline,
              onPressed: () {},
              color: AppColors.kprice,
            ),
          ],
        ),

        // زر الحذف
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: () {
            // تأكيد الحذف
            ShowDialog2(context);
          },
        ),
      ],
    );
  }
}
