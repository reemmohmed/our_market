import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const TitelTextWidget(
        text: "Enter Your Email To reset Password",
        color: AppColors.darkScaffold,
        fontSize: 25,
      ),
      Card(
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.lightScaffold,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(8),
        color: AppColors.lightScaffold,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomTextForm(
                  // validator: (vailu) {},
                  lableText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomElevateGenaric(
                text: "Subment",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
