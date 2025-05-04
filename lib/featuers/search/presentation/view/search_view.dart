import 'package:flutter/material.dart';
import 'package:our_market/core/componant/custom_app_bar.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/store/presentation/view/widgets/custom_all_product_store.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          leading: CustomIconButton(
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () => Navigator.pop(context)),
          title: const TitelTextWidget(text: "Search Result"),
        ),
        body: const SearchViewBody(),
      ),
    );
  }
}

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const CustomAllProductStore();
              }),
        ],
      ),
    );
  }
}
