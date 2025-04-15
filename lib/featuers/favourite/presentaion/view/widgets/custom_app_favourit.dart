import 'package:flutter/material.dart';
import 'package:our_market/core/componant/custom_text_search.dart';

class CustomAppFavourit extends StatelessWidget {
  const CustomAppFavourit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomTextSeach(hitText: "Search for favourt"),
            )),
        IconButton(onPressed: () {}, icon: const Icon(Icons.clear)),
      ],
    );
  }
}
