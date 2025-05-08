import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/featuers/favourite/presentaion/view/widgets/custom_app_favourit.dart';
import 'package:our_market/featuers/favourite/presentaion/view/widgets/favourits_view_body.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product_list.dart';

class FavoutitsView extends StatelessWidget {
  const FavoutitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProduct(),
      child: const SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60), child: CustomAppFavourit()),
          body: const AllProductList(),
        ),
      ),
    );
  }
}
