import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/auth/presentaion/view/widget/custom_tet_form.dart';

class EditNameViewBody extends StatelessWidget {
  const EditNameViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CustomTextForm(
            lableText: "YourName",
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {}, child: const TitelTextWidget(text: "Update"))
        ],
      ),
    );
  }
}
