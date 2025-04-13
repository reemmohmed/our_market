import 'package:flutter/material.dart';

class LodingManger extends StatelessWidget {
  const LodingManger({super.key, required this.isloading, required this.child});
  final bool isloading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isloading) ...[
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ]
      ],
    );
  }
}
