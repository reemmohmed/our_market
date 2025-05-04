import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/function/navigate_without_back.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/data/user_data_model.dart';
import 'package:our_market/featuers/auth/presentaion/manger/cubit/authentication_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/product_detalse/mange/DotesImage/dotes_image_cubit.dart';
import 'package:our_market/featuers/product_detalse/mange/rates/rates_cubit.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/product_detalse_view.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_buttom_buy.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_detals_price.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_list_comment.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_name_and_favourit.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/custom_total_rating.dart';

import 'package:our_market/featuers/product_detalse/presentation/view/widgets/product_dots_indecator.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/product_image_saroursel.dart';

import 'componantsview/custom_rating.dart';

class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  final TextEditingController _commsentController = TextEditingController();
  @override
  void dispose() {
    _commsentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List<ProductModel> products = context.read<HomeCubit>().products;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DotesImageCubit(),
        ),
        BlocProvider(
          create: (_) =>
              RatesCubit()..getRates(productId: widget.product.productId!),
        ),
      ],
      child: BlocConsumer<RatesCubit, RatesState>(
        listener: (context, state) async {
          if (state is AddOrPutchRateRateForUserSuccess) {
            navigateWithoutBack(
                context, ProductDetalseView(product: widget.product));
          }
        },
        builder: (context, state) {
          RatesCubit cubit = context.read<RatesCubit>();

          // watch send or read data of one only
          // RatesCubit cubitubdaterate = context.watch<RatesCubit>();
          return state is RatesLoading || state is AddCoomentLoding
              ? const CircleLoading()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageCarousel(
                            imageUrls: widget.product.imageUrl != null
                                ? [widget.product.imageUrl!]
                                : []),
                        const SizedBox(height: 12),
                        ProductDotsIndicator(
                            imageUrls: widget.product.imageUrl != null
                                ? [widget.product.imageUrl!]
                                : []),
                        const SizedBox(
                          height: 9,
                        ),
                        CustomTotalrating(
                          text: "${cubit.rates.length}",
                        ),
                        CustomDetalsPrice(
                          product: widget.product,
                        ),
                        CustmnameandFavourit(
                          product: widget.product,
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
                          onRatingUpdate: (rating) {
                            cubit.addrateorputchrate(
                              productId: widget.product.productId!,
                              data: {
                                "for_user": cubit.UserId,
                                "for_product": widget.product.productId,
                                "rate": rating.toInt(),
                              },
                            );
                          },
                          initialRating: cubit.userRate.toDouble(),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: TitelTextWidget(
                            text: "Comments",
                            fontSize: 25,
                          ),
                        ),
                        CustomTextForm(
                          controller: _commsentController,
                          lableText: " Type Your feadback",
                          suffixIcon: CustomIconButton(
                            icon: Icons.send,
                            onPressed: () async {
                              await cubit.addComments(data: {
                                "comment": _commsentController.text.trim(),
                                "for_user": cubit.UserId,
                                "for_product": widget.product.productId,
                                "user_name": context
                                        .read<AuthenticationCubit>()
                                        .userData
                                        ?.name ??
                                    "User",
                              });
                              _commsentController.clear();
                            },
                          ),
                        ),
                        CustomListComment(
                          productModel: widget.product,
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
