import 'package:flutter/material.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/catogery_list.dart';

class CatogeryItem extends StatelessWidget {
  const CatogeryItem({
    super.key,
    required this.catogery,
  });
  final CatogeriesModel catogery;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.height * 0.15,
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: 33,
              child: Icon(
                catogery.icon,
                size: 55,
              ),
            ),
            Text(catogery.text)
          ],
        ),
      ),
    );
  }
}
