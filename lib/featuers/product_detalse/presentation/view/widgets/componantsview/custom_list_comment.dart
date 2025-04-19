import 'package:flutter/material.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/comment_user.dart';

class CustomListComment extends StatelessWidget {
  const CustomListComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const CommentUser();
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 20, // من بداية السطر
            endIndent: 20,
          );
        },
        itemCount: 10);
  }
}
