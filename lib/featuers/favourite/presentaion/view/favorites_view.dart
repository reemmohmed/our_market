import 'package:flutter/material.dart';
import 'package:our_market/featuers/favourite/presentaion/view/widgets/custom_app_favourit.dart';
import 'package:our_market/featuers/favourite/presentaion/view/widgets/favourits_view_body.dart';

class FavoutitsView extends StatelessWidget {
  const FavoutitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), child: CustomAppFavourit()),
        body: FavouritsViewBody(),
      ),
    );
  }
}
