import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/AppServer/paymop_key.dart';
import 'package:our_market/core/componant/shimmer_iamge.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/manger/cubit/authentication_cubit.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/nave_bar/manger/cubit/nave_bar_cubit_cubit.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/product_detalse_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({
    super.key,
    required this.product,
    this.onPressed,
    required this.isFavourite,
    required this.onPaymentSuccess,
  });
  final ProductModel product;
  final void Function()? onPressed;
  final bool isFavourite;
  final Function() onPaymentSuccess;

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  void initState() {
    // authCubit = context.read<AuthenticationCubit>();
    PaymentData.initialize(
      apiKey:
          apiKeypaymop, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
      iframeId: iframeIdpaymop, // Required: Found under Developers -> iframes
      integrationCardId:
          integrationCardId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
      integrationMobileWalletId:
          integrationMobileWalletId, // Required: Found under Developers -> Payment Integrations -> Mobile Wallet ID

      // Optional User Data
      // userData: UserData(
      //   email: authCubit.userData!.email, // Optional: Defaults to 'NA'
      //   // phone: "User Phone", // Optional: Defaults to 'NA'
      //   name: authCubit.userData!.name, // Optional: Defaults to 'NA'
      //   // lastName: "User Last Name", // Optional: Defaults to 'NA'
      // ),

      // // Optional Style Customizations
      // style: Style(
      //   primaryColor: Colors.blue, // Default: Colors.blue
      //   scaffoldColor: Colors.white, // Default: Colors.white
      //   appBarBackgroundColor: Colors.blue, // Default: Colors.blue
      //   appBarForegroundColor: Colors.white, // Default: Colors.white
      //   textStyle: TextStyle(), // Default: TextStyle()
      //   buttonStyle: ElevatedButton.styleFrom(), // Default: ElevatedButton.styleFrom()
      //   circleProgressColor: Colors.blue, // Default: Colors.blue
      //   unselectedColor: Colors.grey, // Default: Colors.grey
      // ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => navigatorTo(
          context,
          ProductDetalseView(
            product: widget.product,
          ),
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: ShimmerImage(
                      imageUrl: widget.product.imageUrl ??
                          "https://ichef.bbci.co.uk/news/1024/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp",
                    ),
                  ),
                  Positioned(
                      child: Container(
                    alignment: Alignment.center,
                    height: 44,
                    width: 88,
                    decoration: const BoxDecoration(
                      color: AppColors.kprimaryColoblue,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: SubtitelTextWidget(
                      text: "${widget.product.sale} OFF",
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitelTextWidget(
                          text: widget.product.productName ?? "",
                          fontSize: 25,
                        ),
                        IconButton(
                          onPressed: widget.onPressed,
                          icon: Icon(
                            widget.isFavourite
                                ? Ionicons.heart
                                : Ionicons.heart_outline,
                            size: 30,
                            color: widget.isFavourite
                                ? AppColors.ksignUp
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SubtitelTextWidget(
                              text: "${widget.product.price}",
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                            SubtitelTextWidget(
                              text: widget.product.oldPrice ?? "",
                              fontSize: 20,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kblue,
                            elevation: 2,
                          ),
                          onPressed: () {
                            // context
                            //     .read<NaveBarCubitCubit>()
                            //     .changcurrentPage(3);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentView(
                                  onPaymentSuccess: widget.onPaymentSuccess,
                                  onPaymentError: () {
                                    log("Payment Error");
                                    // Handle payment error
                                  },
                                  price: double.parse(widget.product
                                      .price!), // Required: Total price (e.g., 100 for 100 EGP)
                                ),
                              ),
                            );
                          },
                          child: TitelTextWidget(
                            text: "Buy Now",
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// not found for allproductList that or this