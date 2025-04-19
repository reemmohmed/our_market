import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/const/loding_manger.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/function/show_mes.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/featuers/auth/presentaion/manger/cubit/authentication_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/view/singup_view.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_doint_account.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_forget_password.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';
import 'package:our_market/featuers/nave_bar/presentation/view/navebar.dart';

class CustomlogenCard extends StatefulWidget {
  const CustomlogenCard({
    super.key,
  });

  @override
  State<CustomlogenCard> createState() => _CustomlogenCardState();
}

class _CustomlogenCardState extends State<CustomlogenCard> {
  bool isLoading = false;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // late FocusNode emailfocuseNode;
  // late FocusNode passwordfocuseNode;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // emailfocuseNode = FocusNode();
    // passwordfocuseNode = FocusNode();
    super.dispose();
  }

  Future validate() async {
    if (key.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      try {
        setState(() {
          isLoading = true; // بدأ التحميل
        });
        AuthenticationCubit logincubit = context.read<AuthenticationCubit>();
        await logincubit.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (!mounted) return;
        // يمكنك إضافة التنقل هنا بعد النجاح
        // Navigator.pushNamed(context, NavigatioBar.id);
      } catch (error) {
        showMassegeScaffold(context, e.toString());
      } finally {
        setState(() {
          isLoading = false; // إيقاف التحميل
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showMassegeScaffold(context, state.error);
        }
      },
      builder: (context, state) {
        AuthenticationCubit authcubit = context.read<AuthenticationCubit>();
        return state is LoginLoading
            ? const Center(child: CircularProgressIndicator())
            : Card(
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
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        CustomTextForm(
                          // focusNode: emailfocuseNode,
                          controller: emailController,

                          // validator: (vailu) {},
                          lableText: "Email",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        CustomTextForm(
                          // focusNode: passwordfocuseNode,
                          controller: passwordController,
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
                            // validate();
                            if (key.currentState!.validate()) {
                              authcubit.login(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                            }

                            /////////////////************ */
                            // navigatorTo(
                            //   context,
                            //   const NaveBar(),
                            // );
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
                            navigatorTo(context, const SingupView());
                          },
                          text: "Don't have an Account ?",
                          subtitel: "Sign Up",
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
