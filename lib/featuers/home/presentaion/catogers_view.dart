import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product_list.dart';

class CatogersView extends StatelessWidget {
  const CatogersView({super.key, required this.catogery});
  final String catogery;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          leading: CustomIconButton(
            icon: Icons.arrow_back_ios_rounded,
            onPressed: () => Navigator.pop(context),
          ),
          title: TitelTextWidget(text: catogery),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (context) => HomeCubit()..getProduct(catogery: catogery),
            child: AllProductList(
              catogery: catogery,
            ),
          ),
        ),
      ),
    );
  }
}
