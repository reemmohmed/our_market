import 'package:flutter/material.dart';
import 'package:our_market/core/componant/custom_app_bar.dart';
import 'package:our_market/core/function/navigator_push.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            controller: _seachController,
            onPressed: () {
              if (_seachController.text.isNotEmpty) {
                navigatorTo(
                    context,
                    SearchView(
                      query: _seachController.text,
                    ));
              }
            },
          ),
        ),
        body: const AllProductList(),
        // body: const StoreViewBody(),
      ),
    );
  }
}
// AllProductList  you need this it is important