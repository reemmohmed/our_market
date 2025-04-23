import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/function/show_mes.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/manger/cubit/authentication_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is ResetpasswordSucsess) {
          Navigator.pop(context);
          showMassegeScaffold(context, "Check Your Email To Reset Password");
        }
        if (state is ResetpasswordFailuer) {
          showMassegeScaffold(context, state.error);
        }
      },
      builder: (context, state) {
        return state is ResetpasswordLoging
            ? const CircleLoading()
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    child: Form(
                      key: key,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextForm(
                              controller: emailController,
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
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                context
                                    .read<AuthenticationCubit>()
                                    .resetpassword(
                                      email: emailController.text.trim(),
                                    );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]);
      },
    );
  }
}
