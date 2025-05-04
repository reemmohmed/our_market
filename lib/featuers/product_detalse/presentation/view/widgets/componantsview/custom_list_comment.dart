import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/circle_loading.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/featuers/home/data/product_model.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/componantsview/comment_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomListComment extends StatelessWidget {
  const CustomListComment({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client
            .from("comments_table")
            .stream(primaryKey: ["id"])
            .eq("for_product", productModel.productId!)
            .order("created_at"),
        builder: (context, snapshot) {
          List<Map<String, dynamic>>? data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircleLoading();
          } else if (!snapshot.hasData) {
            return const Center(
              child: SubtitelTextWidget(text: "No Comment data Yet"),
            );
          } else if (snapshot.hasData) {
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
          } else {
            return const Center(
              child: SubtitelTextWidget(
                  text: "Somthing winth wrong plese try again later"),
            );
          }
        });
  }
}
