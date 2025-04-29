import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/product_detalse/mange/DotesImage/dotes_image_cubit.dart';
import 'package:our_market/featuers/product_detalse/mange/rates/rates_cubit.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_buttom_buy.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_detals_price.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_list_comment.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_name_and_favourit.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_total_rating.dart';

import 'package:our_market/featuers/product_detalse/presentation/view/widgets/product_dots_indecator.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/product_image_saroursel.dart';

import 'componantsview/custom_rating.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    // final List<ProductModel> products = context.read<HomeCubit>().products;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DotesImageCubit(),
        ),
        BlocProvider(
          create: (_) => RatesCubit()..getRates(productId: product.productId!),
        ),
      ],
      child: BlocConsumer<RatesCubit, RatesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // access the rates from the cubit
          // final List<RatesModel> rates = context.read<RatesCubit>().rates;
          RatesCubit cubit = context.read<RatesCubit>();
          ;
          return state is RatesLoading
              ? const CircleLoading()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageCarousel(
                            imageUrls: product.imageUrl != null
                                ? [product.imageUrl!]
                                : []),
                        const SizedBox(height: 12),
                        ProductDotsIndicator(
                            imageUrls: product.imageUrl != null
                                ? [product.imageUrl!]
                                : []),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomTotalrating(
                          text: "${cubit.rates.length}",
                        ),
                        CustomDetalsPrice(
                          product: product,
                        ),
                        CustmnameandFavourit(
                          product: product,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const CustomButtomBuy(),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomRating(
                          initialRating: cubit.userRate.toDouble(),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: TitelTextWidget(
                            text: "Comments",
                            fontSize: 25,
                          ),
                        ),
                        const CustomTextForm(
                          lableText: " Type Your feadback",
                          suffixIcon: CustomIconButton(icon: Icons.send),
                        ),
                        const CustomListComment()
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
