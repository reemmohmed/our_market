import 'package:flutter/material.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/custom_detals_history.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/custom_image_history.dart';

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: size.width * 0.6, // عرض العنصر 60% من الشاشة (مثلاً)
        height: size.height * 0.25,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomImageHistory(
              imageUrl:
                  "https://ichef.bbci.co.uk/news/1024/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp",
            ),
            CustomDetalseHistory(
              titel: "titelpre",
              subtitel: "descraptijjjjjjjj\njjjjjjjjtfggon",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
