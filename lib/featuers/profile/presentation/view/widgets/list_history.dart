import 'package:flutter/material.dart';
import 'package:our_market/featuers/profile/presentation/view/widgets/history_order.dart';

class ListHiistory extends StatelessWidget {
  const ListHiistory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .26,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 1),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: HistoryOrder(),
          );
        },
      ),
    );
  }
}
