import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/widgets/split_text_two_lines.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustomDetalseHistory extends StatelessWidget {
  const CustomDetalseHistory({
    super.key,
    required this.titel,
    required this.subtitel,
    this.onPressed,
  });
  final String titel, subtitel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitelTextWidget(text: titel),
                const SizedBox(height: 4),
                const SplitTextTwoLines(
                  text:
                      "Welcome back reem Mohamed reem Mohamedreem Mohamedreem Mohamedreem Mohamed ",
                  style: TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              icon: const Icon(Ionicons.ellipsis_vertical), onPressed: onPressed

              // خيارات مثل: إزالة من السجل

              ),
        ],
      ),
    );
  }
}
