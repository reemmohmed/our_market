import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/function/show_mes.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/manger/cubit/authentication_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_doint_account.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';
import 'package:our_market/featuers/nave_bar/presentation/view/navebar.dart';

class SingupViewBody extends StatefulWidget {
  const SingupViewBody({super.key});

  @override
  State<SingupViewBody> createState() => _SingupViewBodyState();
}

class _SingupViewBodyState extends State<SingupViewBody> {
  bool obscureText = true;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SinghUpFailure) {
          showMassegeScaffold(context, state.error);
        }
        if (state is SinghUpSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return NaveBar();
          }));
        }
      },
      builder: (context, state) {
        AuthenticationCubit regestercubit = context.read<AuthenticationCubit>();
        return state is SinghUpLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        screenHeight - MediaQuery.of(context).padding.vertical,
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
                            child: Form(
                              key: key,
                              child: Column(
                                children: [
                                  CustomTextForm(
                                    // validator: (vailu) {},
                                    lableText: "Name",
                                    keyboardType: TextInputType.emailAddress,
                                    controller: nameController,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  CustomTextForm(
                                    // validator: (vailu) {},
                                    lableText: "Email",
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  CustomTextForm(
                                    obscuringCharacter: "*",
                                    obscureText: obscureText,
                                    // validator: (vailu) {},
                                    lableText: "Password",
                                    keyboardType: TextInputType.streetAddress,
                                    controller: passwordController,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscureText = !obscureText;
                                        });
                                      },
                                      icon: Icon(
                                        obscureText
                                            ? Icons.visibility_off_sharp
                                            : Icons.visibility,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  CustomElevatedButton(
                                    onPressed: () {
                                      if (key.currentState!.validate()) {
                                        regestercubit.regester(
                                            name: nameController.text.trim(),
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim());
                                      }
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
                                      Navigator.pop(context);
                                    },
                                    text: "Oready have an Account ? ",
                                    subtitel: "Login ",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
