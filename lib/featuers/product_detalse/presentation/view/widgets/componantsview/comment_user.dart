import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';
import 'package:our_market/featuers/product_detalse/data/commentdata.dart';

class CommentUser extends StatelessWidget {
  const CommentUser({
    super.key,
    required this.commentdata,
  });
  final Commentdata commentdata;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: TitelTextWidget(
                      text: commentdata.userName ?? "User",
                      fontSize: 22,
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: SubtitelTextWidget(
                      maxLines: 7, text: commentdata.comment ?? " No Comment"),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SubtitelTextWidget(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      maxLines: 7,
                      text: commentdata.replay ?? ""),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
