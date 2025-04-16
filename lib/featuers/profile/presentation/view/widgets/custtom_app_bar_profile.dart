import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/them/cubit/them_cubit_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';

class CustomAppbarProfile extends StatelessWidget {
  const CustomAppbarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Ionicons.settings_outline)),
        const CustomIconButton(
          icon: Ionicons.notifications_outline,
        ),
        const CustomIconButton(
          icon: Ionicons.search_outline,
        ),
        const Spacer(),
        BlocBuilder<ThemCubit, ThemCubitState>(
          builder: (context, state) {
            final themCubit = BlocProvider.of<ThemCubit>(context);
            final isDarkMode = state is ThemLoaded ? state.isDarkTheme : false;

            return IconButton(
              onPressed: () {
                // عكس الوضع الحالي عند الضغط
                themCubit.setIsDarkTheme(!isDarkMode);
              },
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                size: 24,
              ),
            );
          },
        ),
      ],
    );
  }
}
