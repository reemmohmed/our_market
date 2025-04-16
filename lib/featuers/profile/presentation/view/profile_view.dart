import 'package:flutter/material.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/custtom_app_bar_profile.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppbarProfile(),
        ),
        body: ProfileViewBody(),
      ),
    );
  }
}
