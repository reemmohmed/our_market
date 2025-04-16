import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/them/Styels.dart';
import 'package:our_market/core/them/cubit/them_cubit_cubit.dart';
import 'package:our_market/featuers/nave_bar/presentation/view/navebar.dart';
import 'package:our_market/test/runtest.dart';

void main() {
  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return ThemCubit()..getThem();
          },
        )
      ],
      child: BlocBuilder<ThemCubit, ThemCubitState>(
        builder: (context, state) {
          bool isDark = false;

          if (state is ThemLoaded) {
            isDark = state.isDarkTheme;
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'OurMarket',
            theme: Styels.themeData(isDarkTheem: isDark, context: context),

            home: const NaveBar(),
            //  home: Runtest(),
          );
        },
      ),
    );
  }
}
