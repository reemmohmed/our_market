import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product.dart';

// AllProductList.dart
class AllProductList extends StatelessWidget {
  const AllProductList({
    super.key,
    this.query,
    this.catogery,
  });

  final String? query;
  final String? catogery;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<ProductModel> products;

        if (query != null) {
          products = context.watch<HomeCubit>().saechResult;
        } else if (catogery != null) {
          products = context.watch<HomeCubit>().catogeres;
        } else {
          products = context.watch<HomeCubit>().products;
        }

        return state is GetDataLoading
            ? const CircleLoading()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return AllProduct(product: products[index]);
                },
              );
      },
    );
  }
}

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
//     this.catogery,
//   });

//   final String? query;
//   final String? catogery;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         final homeCubit = context.read<HomeCubit>();

//         if (query != null) {
//           homeCubit.searchproduct(query);
//         }

//         final products = query != null
//             ? homeCubit.saechResult
//             : catogery != null
//                 ? homeCubit.getCatogery(catogery)
//                 : homeCubit.products;

//         return state is GetDataLoading
//             ? const Center(child: CircleLoading())
//             : ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   return AllProduct(
//                     product: products[index],
//                   );
//                 },
//               );
//       },
//     );
//   }
// }
