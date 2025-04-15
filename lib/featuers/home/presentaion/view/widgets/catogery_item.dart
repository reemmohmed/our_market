import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
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
    final avatarRadius = size.width * 0.08;
    final iconSize = size.width * 0.07;
    return SizedBox(
      width: size.width * 0.25,
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: avatarRadius,
            child: Icon(
              catogery.icon,
              size: iconSize,
            ),
          ),
          SubtitelTextWidget(
            maxLines: 1,
            text: catogery.text,
            textAlign: TextAlign.center,
            fontSize: size.width * 0.035,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
