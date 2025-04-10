import 'package:flutter/material.dart';
import 'package:our_market/core/componant/custom_text_search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextSeach(
                hitText: "",
              ),
            )
          ],
        ),
      ),
    );
  }
}
