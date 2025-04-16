import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_elevated_button.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/edit_name_view.dart';

class EditNameView extends StatelessWidget {
  const EditNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 3,
          title: TitelTextWidget(
            text: "Update Name",
            color: Theme.of(context).primaryColor,
          ),
          leading: CustomIconButton(
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () => Navigator.pop(context)),
        ),
        body: const EditNameViewBody(),
      ),
    );
  }
}
