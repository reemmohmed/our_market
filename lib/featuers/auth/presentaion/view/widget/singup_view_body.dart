import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_doint_account.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';

class SingupViewBody extends StatelessWidget {
  const SingupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight - MediaQuery.of(context).padding.vertical,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitelTextWidget(
                text: "wellcom To Our Market",
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
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const CustomTextForm(
                        // validator: (vailu) {},
                        lableText: "Name",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
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
                      CustomElevatedButton(
                        onPressed: () {},
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
                          Navigator.pop(context);
                        },
                        text: "Oready have an Account ? ",
                        subtitel: "Login ",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
