import 'package:flutter/material.dart';
import 'package:our_market/core/const/loding_manger.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_logen_card.dart';

class LogenViewBody extends StatelessWidget {
  const LogenViewBody({super.key});
  final bool isloaing = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight - MediaQuery.of(context).padding.vertical,
          ),
          child: const IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 100,
                // ),
                TitelTextWidget(text: "Hi👋👋"),
                TitelTextWidget(
                  text: "wellcom To Our Market",
                  fontSize: 25,
                ),
                CustomlogenCard(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
