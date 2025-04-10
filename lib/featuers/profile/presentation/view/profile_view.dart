import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TitelTextWidget(text: "Profile View  "),
    );
  }
}
