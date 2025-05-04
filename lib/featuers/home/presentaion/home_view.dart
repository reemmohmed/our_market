import 'package:flutter/material.dart';
import 'package:our_market/core/componant/custom_app_bar.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/home_view_body.dart';
import 'package:our_market/featuers/search/presentation/view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            onPressed: () {
              navigatorTo(context, const SearchView());
            },
          ),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
