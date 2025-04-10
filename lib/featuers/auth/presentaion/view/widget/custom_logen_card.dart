import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/featuers/auth/presentaion/view/singup_view.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_doint_account.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_forget_password.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';
import 'package:our_market/featuers/nave_bar/presentation/view/navebar.dart';

class CustomlogenCard extends StatelessWidget {
  const CustomlogenCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.lightScaffold,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(8),
      color: AppColors.lightScaffold,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomTextForm(
              // validator: (vailu) {},
              lableText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextForm(
              obscuringCharacter: "*",
              obscureText: true,
              // validator: (vailu) {},
              lableText: "Password",
              keyboardType: TextInputType.streetAddress,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off_sharp,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            const CustomForgetPassword(),
            const SizedBox(
              height: 17,
            ),
            CustomElevatedButton(
              onPressed: () {
                navigatorpush(
                  context,
                  const NaveBar(),
                );
              },
              text: "Login",
            ),
            const SizedBox(
              height: 17,
            ),
            CustomElevatedIcon(
              text: "Google",
              backgroundColor: Colors.red,
              onPressed: () {},
              icon: Ionicons.logo_google,
            ),
            const SizedBox(
              height: 17,
            ),
            CustonDontAccount(
              onpressed: () {
                navigatorpush(context, const SingupView());
              },
              text: "Don't have an Account ?",
              subtitel: "Sign Up",
            )
          ],
        ),
      ),
    );
  }
}
