import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/function/navigator_to_out.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/data/user_data_model.dart';
import 'package:our_market/featuers/auth/presentaion/manger/cubit/authentication_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/view/logen_view.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/my_cart_view.dart';
import 'package:our_market/featuers/profile/presentation/view/edit_name_view.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/custom_list_titel.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/list_history.dart';

// class ProfileViewBody extends StatelessWidget {
//   const ProfileViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     UserDataModel? user = context.read<AuthenticationCubit>().userData;
//     return BlocProvider(
//       create: (context) => AuthenticationCubit()..getUserData(),
//       child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
//         listener: (context, state) {
//           if (state is SignOutSucsess) {
//             navigatorToOut(context, const LogenView());
//           }
//         },
//         builder: (context, state) {
//           AuthenticationCubit authCubit = context.read<AuthenticationCubit>();
//           return state is SignOutLoading || state is GetUserDataLoading
//               ? const CircleLoading()
//               : Center(
//                   child: SingleChildScrollView(
//                     child: Card(
//                       color: Theme.of(context).canvasColor,
//                       child: Column(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: Theme.of(context).primaryColor,
//                             foregroundColor: AppColors.lightScaffold,
//                             radius: 55,
//                             child: TitelTextWidget(
//                                 text:
//                                     user?.email.substring(0, 1).toUpperCase() ??
//                                         "?"),
//                           ),
//                           TitelTextWidget(text: user?.name ?? "..."),
//                           TitelTextWidget(text: user?.email ?? "..."),
//                           const SizedBox(
//                             height: 7,
//                           ),
//                           const Align(
//                             alignment: Alignment.centerLeft,
//                             child: TitelTextWidget(
//                               text: "History",
//                               fontSize: 23,
//                             ),
//                           ),
//                           const ListHiistory(),
//                           CustomListTitel(
//                             text: "EditName",
//                             icon: Ionicons.person,
//                             onTap: () {
//                               navigatorTo(context, const EditNameView());
//                             },
//                           ),
//                           const SizedBox(
//                             height: 7,
//                           ),
//                           CustomListTitel(
//                             text: "MyOrders",
//                             icon: Icons.shopping_basket_outlined,
//                             onTap: () {
//                               navigatorTo(context, const MyCartView());
//                             },
//                           ),
//                           const SizedBox(
//                             height: 7,
//                           ),
//                           CustomListTitel(
//                             text: "LogOut",
//                             icon: Ionicons.log_out,
//                             onTap: () async {
//                               await authCubit.signOut();
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//         },
//       ),
//     );
//   }
// }
class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit()..getUserData(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is SignOutSucsess) {
            navigatorToOut(context, const LogenView());
          }
        },
        builder: (context, state) {
          if (state is GetUserDataLoading || state is SignOutLoading) {
            return const CircleLoading();
          }

          if (state is GetUserDataSucsess) {
            final user = context.read<AuthenticationCubit>().userData;

            return Center(
              child: SingleChildScrollView(
                child: Card(
                  color: Theme.of(context).canvasColor,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: AppColors.lightScaffold,
                        radius: 55,
                        child: TitelTextWidget(
                          text:
                              user?.email.substring(0, 1).toUpperCase() ?? "?",
                        ),
                      ),
                      TitelTextWidget(text: user?.name ?? "..."),
                      TitelTextWidget(text: user?.email ?? "..."),
                      const SizedBox(height: 7),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: TitelTextWidget(
                          text: "History",
                          fontSize: 23,
                        ),
                      ),
                      const ListHiistory(),
                      CustomListTitel(
                        text: "EditName",
                        icon: Ionicons.person,
                        onTap: () {
                          navigatorTo(context, const EditNameView());
                        },
                      ),
                      const SizedBox(height: 7),
                      CustomListTitel(
                        text: "MyOrders",
                        icon: Icons.shopping_basket_outlined,
                        onTap: () {
                          navigatorTo(context, const MyCartView());
                        },
                      ),
                      const SizedBox(height: 7),
                      CustomListTitel(
                        text: "LogOut",
                        icon: Ionicons.log_out,
                        onTap: () async {
                          await context.read<AuthenticationCubit>().signOut();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          // إذا الحالة الأولية مثلا أو فشل، ممكن تظهر رسالة أو واجهة فارغة
          return const Center(child: Text("لا توجد بيانات للعرض"));
        },
      ),
    );
  }
}
