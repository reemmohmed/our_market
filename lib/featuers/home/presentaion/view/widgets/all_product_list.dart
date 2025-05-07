// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:our_market/core/widgets/circle_loading.dart';
// import 'package:our_market/featuers/home/data/product_model.dart';
// import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
// import 'package:our_market/featuers/home/presentaion/view/widgets/all_product.dart';

// class AllProductList extends StatelessWidget {
//   const AllProductList({
//     super.key,
//     this.query,
//   });
//   final String? query;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit()..getProduct(
//         query: query,
//       ),
//       child: BlocConsumer<HomeCubit, HomeState>(
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           List<ProductModel> products = query != null
//               ? context.read<HomeCubit>().saechResult
//               : context.read<HomeCubit>().products;
//           return state is GetDataLoading
//               ? const CircleLoading()
//               : ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: products.length,
//                   itemBuilder: (context, index) {
//                     return AllProduct(
//                       product: products[index],
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product.dart';

class AllProductList extends StatelessWidget {
  const AllProductList({
    super.key,
    this.query,
  });

  final String? query;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    if (query != null) {
      homeCubit.searchproduct(query);
    }

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final products =
            query != null ? homeCubit.saechResult : homeCubit.products;

        return state is GetDataLoading
            ? const Center(child: CircleLoading())
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return AllProduct(
                    product: products[index],
                  );
                },
              );
      },
    );
  }
}
