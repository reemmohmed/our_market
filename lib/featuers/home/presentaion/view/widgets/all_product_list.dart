import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/function/show_mes.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product.dart';

// AllProductList.dart
class AllProductList extends StatelessWidget {
  const AllProductList({
    super.key,
    this.query,
    this.catogery,
    this.isfavouritView = false,
    required this.emptyImagePath,
    required this.message1Titel,
    required this.message2subtitel,
  });

  final String? query;
  final String? catogery;
  final bool isfavouritView;
  final String emptyImagePath;
  final String message1Titel;
  final String message2subtitel;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is BuyProductSuccess) {
          showMassegeScaffold(context, "payment is Sussful");
        }
      },
      builder: (context, state) {
        List<ProductModel> products;

        if (query != null) {
          products = homeCubit.saechResult;
        } else if (catogery != null) {
          products = homeCubit.catogeres;
        } else if (isfavouritView) {
          products = homeCubit.favouritProductList;
        } else {
          products = homeCubit.products;
        }

        return state is GetDataLoading
            ? const CircleLoading()
            : products.isEmpty
                ? CustomIsEmpity(
                    message1Titel: message1Titel,
                    message2subtitel: message2subtitel,
                    emptyImagePath: emptyImagePath)
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return AllProduct(
                          onPaymentSuccess: () {
                            homeCubit.buyproduct(
                                productId: products[index].productId!);
                          },
                          isFavourite: homeCubit
                              .checkIsFavorite(products[index].productId!),
                          onPressed: () {
                            bool isfavourtes = homeCubit
                                .checkIsFavorite(products[index].productId!);

                            isfavourtes
                                ? homeCubit.removeFromFavourites(
                                    products[index].productId!)
                                : homeCubit
                                    .addToFavourtes(products[index].productId!);
                          },
                          product: products[index]);
                    },
                  );
      },
    );
  }
}

class CustomIsEmpity extends StatelessWidget {
  const CustomIsEmpity({
    super.key,
    required this.emptyImagePath,
    required this.message1Titel,
    required this.message2subtitel,
  });

  final String emptyImagePath;
  final String message1Titel;
  final String message2subtitel;

  @override
  Widget build(BuildContext context) {
    final siz = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            emptyImagePath,
            width: siz.width * 3 / 3,
            height: siz.width * 3 / 3,
          ),
          const SizedBox(height: 16),
          TitelTextWidget(
            text: message1Titel,
            //  "Ups!... no results found",
          ),
          const SizedBox(height: 16),
          SubtitelTextWidget(
            text: message2subtitel,
            //  "Please try another Search",
            //  "Please try another Search"
          ),
        ],
      ),
    );
  }
}
