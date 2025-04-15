import 'package:flutter/material.dart';
import 'package:our_market/core/componant/custom_app_bar.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppbar(),
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
