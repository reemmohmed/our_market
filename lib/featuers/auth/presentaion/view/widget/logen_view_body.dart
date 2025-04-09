import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_logen_card.dart';

class LogenViewBody extends StatelessWidget {
  const LogenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
    );
  }
}
