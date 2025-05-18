import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/function/show_mes.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product_list.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/widgets/custom_buttom_cheet.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/widgets/custom_my_card.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomSheet: const CustomButtonCheet(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const TitelTextWidget(text: "Your Bag"),
        ),
        body: const CustomListCard(),
      ),
    );
  }
}

class CustomListCard extends StatelessWidget {
  const CustomListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = context.read<HomeCubit>();
        final products = homeCubit.usersOrders;

        // حالة التحميل (جلب البيانات أو حذف الطلب)
        if (state is GetDataLoading || state is RemoveOrderLoading) {
          return const CircleLoading();
        }

        // حالة الخطأ عند الحذف
        if (state is RemoveOrderError) {
          return const Center(
            child: Text(
              "حدث خطأ أثناء حذف الطلب، حاول مرة أخرى",
              style: TextStyle(color: Colors.red),
            ),
          );
        }

        // حالة عدم وجود طلبات
        if (products.isEmpty) {
          return const CustomIsEmpity(
            message1Titel: "Not Found Order",
            message2subtitel: "No Order, please try again",
            emptyImagePath: AppAsset.empityFavourit,
          );
        }

        // عرض قائمة الطلبات
        return ListView.builder(
          shrinkWrap: true,
          // إذا كان بداخل ScrollView
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return CustomMyCart(
              product: product,
              onRemove: () async {
                await homeCubit.removeOrderFromServer(product.productId!);

                if (context.mounted) {
                  showMassegeScaffold(context, "Order removed successfully");
                }
              },
            );
          },
        );
      },
    );
  }
}
