import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/favourite/presentaion/view/widgets/custom_app_favourit.dart';
import 'package:our_market/featuers/favourite/presentaion/view/widgets/favourits_view_body.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product_list.dart';

// class FavoutitsView extends StatelessWidget {
//   const FavoutitsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit()..getProduct(),
//       child: SafeArea(
//         child: Scaffold(
//           appBar: PreferredSize(
//               preferredSize: const Size.fromHeight(60),
//               child: CustomAppFavourit(
//                 onPressed: () {
//                   context.read<HomeCubit>().clearAllFavourites();
//                 },
//               )),
//           body: const SingleChildScrollView(
//             child: Column(
//               children: [
//                 const AllProductList(
//                   isfavouritView: true,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class FavoutitsView extends StatelessWidget {
  const FavoutitsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProduct(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const TitelTextWidget(text: "Your Favourites"),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<HomeCubit>().clearAllFavourites();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),

              //  PreferredSize(
              //   preferredSize: const Size.fromHeight(60),
              //   child: CustomAppFavourit(
              //     onPressed: () {
              //       context.read<HomeCubit>().clearAllFavourites();
              //     },
              //   ),
              // ),

              body: const SingleChildScrollView(
                child: Column(
                  children: [
                    AllProductList(
                      message1Titel: "No Favorites Yet",
                      message2subtitel: "Try adjusting your search or filters",
                      emptyImagePath: AppAsset.empityFavourit,
                      isfavouritView: true,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
