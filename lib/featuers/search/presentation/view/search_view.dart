// import 'package:flutter/material.dart';
// import 'package:our_market/core/componant/custom_app_bar.dart';
// import 'package:our_market/core/widgets/titel_text_widget.dart';
// import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
// import 'package:our_market/featuers/home/presentaion/view/widgets/all_product.dart';
// import 'package:our_market/featuers/home/presentaion/view/widgets/all_product_list.dart';
// import 'package:our_market/featuers/store/presentation/view/widgets/custom_all_product_store.dart';

// class SearchView extends StatelessWidget {
//   const SearchView({super.key, required this.query});
//   final String query;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 2,
//           centerTitle: true,
//           leading: CustomIconButton(
//               icon: Icons.arrow_back_ios_rounded,
//               onPressed: () => Navigator.pop(context)),
//           title: const TitelTextWidget(text: "Search Result"),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               ListView.builder(
//                   itemCount: 20,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return AllProductList(
//                       query: query,
//                     );
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SearchViewBody extends StatelessWidget {
//   const SearchViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ListView.builder(
//               itemCount: 20,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return const AllProductList();
//               }),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/componant/custom_app_bar.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product_list.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().searchproduct(query);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          leading: CustomIconButton(
            icon: Icons.arrow_back_ios_rounded,
            onPressed: () => Navigator.pop(context),
          ),
          title: const TitelTextWidget(text: "Search Result"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AllProductList(
              message1Titel: "Ups!... no results found",
              message2subtitel: "Please try another Search",
              emptyImagePath: AppAsset.empitySearch,
              query: query),
        ),
      ),
    );
  }
}
