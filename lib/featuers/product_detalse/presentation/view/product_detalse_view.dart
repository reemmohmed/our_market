import 'package:flutter/material.dart';

import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';

import 'widgets/roduct_detalse_view body.dart';

class ProductDetalseView extends StatelessWidget {
  const ProductDetalseView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          leading: CustomIconButton(
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () => Navigator.pop(context)),
          title: const TitelTextWidget(text: "ProductName"),
        ),
        body: const ProductDetailBody(),
      ),
    );
  }
}
