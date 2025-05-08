import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/componant/custom_app_bar.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/all_product_list.dart';
import 'package:our_market/featuers/search/presentation/view/search_view.dart';
import 'package:our_market/featuers/store/presentation/view/widgets/store_view_body.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final TextEditingController _seachController = TextEditingController();
  @override
  void dispose() {
    _seachController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProduct(), // ← إنشاء HomeCubit
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppbar(
              controller: _seachController,
              onPressed: () {
                if (_seachController.text.isNotEmpty) {
                  navigatorTo(
                    context,
                    SearchView(query: _seachController.text),
                  );
                }
              },
            ),
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                const AllProductList(
                  message1Titel: "No Items Available",
                  message2subtitel:
                      "There are currently no products in this categor",
                  emptyImagePath: AppAsset.nodata,
                ),
              ],
            ),
          ), // ← دي تقدر توصل لـ HomeCubit دلوقتي
        ),
      ),
    );
  }
}
// AllProductList  you need this it is important
// body: const StoreViewBody(),