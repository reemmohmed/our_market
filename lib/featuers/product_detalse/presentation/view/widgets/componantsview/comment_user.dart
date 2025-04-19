import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CommentUser extends StatelessWidget {
  const CommentUser({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: TitelTextWidget(
                      text: "User",
                      fontSize: 22,
                    )),
                SubtitelTextWidget(
                    maxLines: 7,
                    text:
                        " ertyuiopertyuiopertyuiopertyuiopertyuiopertyuiopertyuiopertyuiopertyuiopertyuiop"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
