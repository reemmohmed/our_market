import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/function/navigator_push.dart';
import 'package:our_market/core/function/navigator_to_out.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/data/user_data_model.dart';
import 'package:our_market/featuers/auth/presentaion/manger/cubit/authentication_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/view/logen_view.dart';
import 'package:our_market/featuers/my_cart/presentaions/views/my_cart_view.dart';
import 'package:our_market/featuers/profile/presentation/view/edit_name_view.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/custom_list_titel.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/list_history.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataModel? user = context.read<AuthenticationCubit>().userData;
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SignOutSucsess) {
          navigatorToOut(context, const LogenView());
        }
      },
      builder: (context, state) {
        AuthenticationCubit authCubit = context.read<AuthenticationCubit>();
        return state is SignOutLoading
            ? const CircleLoading()
            : Center(
                child: SingleChildScrollView(
                  child: Card(
                    color: Theme.of(context).canvasColor,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 55,
                          child: Text("R"),
                        ),
                        TitelTextWidget(text: user?.name ?? "reemMohamed"),
                        TitelTextWidget(
                            text: user?.email ?? "reemMohamed@gmail.com"),
                        const SizedBox(
                          height: 7,
                        ),
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
                        const SizedBox(
                          height: 7,
                        ),
                        CustomListTitel(
                          text: "MyOrders",
                          icon: Icons.shopping_basket_outlined,
                          onTap: () {
                            navigatorTo(context, const MyCartView());
                          },
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        CustomListTitel(
                          text: "LogOut",
                          icon: Ionicons.log_out,
                          onTap: () async {
                            await authCubit.signOut();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
