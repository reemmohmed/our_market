import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/featuers/favourite/presentaion/view/favorites_view.dart';
import 'package:our_market/featuers/home/presentaion/home_view.dart';
import 'package:our_market/featuers/nave_bar/manger/cubit/nave_bar_cubit_cubit.dart';
import 'package:our_market/featuers/profile/presentation/view/profile_view.dart';
import 'package:our_market/featuers/search/presentation/view/search_view.dart';
import 'package:our_market/featuers/store/presentation/view/store_view.dart';

class NaveBar extends StatelessWidget {
  const NaveBar({super.key});
  final List<Widget> pageView = const [
    HomeView(),
    SearchView(),
    StoreView(),
    FavoutitsView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NaveBarCubitCubit(),
      child: BlocBuilder<NaveBarCubitCubit, NaveBarCubitState>(
        builder: (context, state) {
          NaveBarCubitCubit cubit = context.read<NaveBarCubitCubit>();
          return Scaffold(
            body: SafeArea(
              child: pageView[cubit.currentIndex],
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: AppColors.lightScaffold,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                child: GNav(
                    onTabChange: (index) {
                      cubit.changcurrentPage(index);
                    },
                    rippleColor: AppColors
                        .kprimaryColor, // tab button ripple color when pressed
                    // hoverColor: Colors.grey[700]!, // tab button hover color
                    haptic: true, // haptic feedback
                    // tabBorderRadius: 12,
                    curve: Curves.easeIn, // tab animation curves
                    duration: const Duration(
                        milliseconds: 400), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: AppColors.darkScaffold, // unselected icon color
                    activeColor: AppColors
                        .kprimaryColoblue, // selected icon and text color
                    iconSize:
                        24, // tab button icon size // tab button icon size
                    // tabBackgroundColor: AppColors
                    // .kprimaryColoblue, // selected tab background color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ), // navigation bar padding
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Ionicons.search,
                        text: 'Search',
                      ),
                      GButton(
                        icon: Ionicons.storefront,
                        text: 'Store',
                      ),
                      GButton(
                        icon: Ionicons.heart,
                        text: 'Favorite',
                      ),
                      GButton(
                        icon: Ionicons.person,
                        text: 'Profile',
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
    
    
    
    
    
    
    // BlocProvider(
    //   create: (context) => NaveBarCubitCubit(),
    //   child: Scaffold(
    //     body: BlocBuilder<NaveBarCubitCubit, NaveBarCubitState>(
    //       builder: (context, state) {
    //         final changeView = context.read<NaveBarCubitCubit>();

    //         return SafeArea(child: pageView[changeView.currentIndex]);
    //       },
    //     ),
    //     bottomNavigationBar: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: GNav(
    //           onTabChange: (value) {
    //             context.read<NaveBarCubitCubit>().changcurrentPage(value);
    //           },
    //           rippleColor:
    //               Colors.grey[800]!, // tab button ripple color when pressed
    //           hoverColor: Colors.grey[700]!, // tab button hover color
    //           haptic: true, // haptic feedback
    //           tabBorderRadius: 12,
    //           curve: Curves.easeIn, // tab animation curves
    //           duration:
    //               const Duration(milliseconds: 400), // tab animation duration
    //           gap: 8, // the tab button gap between icon and text
    //           color: AppColors.darkScaffold, // unselected icon color
    //           activeColor:
    //               AppColors.kprimaryColoblue, // selected icon and text color
    //           iconSize: 24, // tab button icon size

    //           padding: const EdgeInsets.symmetric(
    //               horizontal: 20, vertical: 5), // navigation bar padding
    //           tabs: const [
    //             GButton(
    //               icon: Ionicons.home,
    //               text: 'Home',
    //             ),
    //             GButton(
    //               icon: Ionicons.heart,
    //               text: 'Likes',
    //             ),
    //             GButton(
    //               icon: Ionicons.search,
    //               text: 'Search',
    //             ),
    //             GButton(
    //               icon: Ionicons.person,
    //               text: 'Profile',
    //             )
    //           ]),
    //     ),
    //   ),
    // );
 
 
 
