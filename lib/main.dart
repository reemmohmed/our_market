import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/featuers/auth/presentaion/view/logen_view.dart';
import 'package:our_market/featuers/nave_bar/manger/cubit/nave_bar_cubit_cubit.dart';

void main() {
  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OurMarket',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kprimaryColor,
        useMaterial3: true,
      ),
      home: const LogenView(),
    );
  }
}
