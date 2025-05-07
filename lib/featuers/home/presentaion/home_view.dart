// import 'package:flutter/material.dart';
// import 'package:our_market/core/componant/custom_app_bar.dart';
// import 'package:our_market/core/function/navigator_push.dart';
// import 'package:our_market/featuers/home/presentaion/view/widgets/home_view_body.dart';
// import 'package:our_market/featuers/search/presentation/view/search_view.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   final TextEditingController _seachController = TextEditingController();
//   @override
//   void dispose() {
//     _seachController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: CustomAppbar(
//             controller: _seachController,
//             onPressed: () {
//               if (_seachController.text.isNotEmpty) {
//                 navigatorTo(
//                     context,
//                     SearchView(
//                       query: _seachController.text,
//                     ));
//               }
//               _seachController.clear()
// ;            },
//           ),
//         ),
//         body: const HomeViewBody(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/componant/custom_app_bar.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/featuers/home/mange/Home_mange/home_cubit.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/home_view_body.dart';
import 'package:our_market/featuers/search/presentation/view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProduct(),
      child: const _HomeViewContent(),
    );
  }
}

class _HomeViewContent extends StatefulWidget {
  const _HomeViewContent();

  @override
  State<_HomeViewContent> createState() => _HomeViewContentState();
}

class _HomeViewContentState extends State<_HomeViewContent> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            controller: _searchController,
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                navigatorTo(
                  context,
                  BlocProvider.value(
                    value: context.read<HomeCubit>(),
                    child: SearchView(
                      query: _searchController.text,
                    ),
                  ),
                );
              }
              _searchController.clear();
            },
          ),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
