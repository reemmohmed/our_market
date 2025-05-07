import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomTextSeach extends StatelessWidget {
  const CustomTextSeach({
    super.key,
    required this.hitText,
    this.controller,
    this.iconprefix,
    this.onTap,
  });
  final TextEditingController? controller;
  final String? hitText;
  final IconData? iconprefix;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      showCursor: FocusScope.of(context).hasFocus,
      cursorColor: Colors.blue, // حدد لون واضح
      cursorWidth: 2.0, // عرض المؤشر
      cursorHeight: 25.0, // ارتفاع المؤشر

      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: onTap, child: Icon(Ionicons.search_outline)),
          prefix: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Icon(
              iconprefix,
              size: 25,
            ),
          ),
          hintText: "$hitText",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 20)),
    );
  }
}
