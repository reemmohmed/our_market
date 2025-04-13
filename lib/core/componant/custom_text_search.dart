import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomTextSeach extends StatelessWidget {
  const CustomTextSeach({
    super.key,
    required this.hitText,
  });
  final String? hitText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: FocusScope.of(context).hasFocus,
      cursorColor: Colors.blue, // حدد لون واضح
      cursorWidth: 2.0, // عرض المؤشر
      cursorHeight: 25.0, // ارتفاع المؤشر

      decoration: InputDecoration(
        prefix: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: const Icon(
            Ionicons.search,
            size: 25,
          ),
        ),
        hintText: "$hitText",
      ),
    );
  }
}
