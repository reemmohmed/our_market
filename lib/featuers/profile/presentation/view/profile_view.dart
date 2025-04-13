import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/them/cubit/them_cubit_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ThemCubit, ThemCubitState>(
          builder: (context, state) {
            final themCubit = BlocProvider.of<ThemCubit>(context);
            final isDarkMode = state is ThemLoaded ? state.isDarkTheme : false;

            return Center(
              child: IconButton(
                onPressed: () {
                  // عكس الوضع الحالي عند الضغط
                  themCubit.setIsDarkTheme(!isDarkMode);
                },
                icon: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  size: 24,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
