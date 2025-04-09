import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/const/size_config.dart';

class Spasehorizental extends StatelessWidget {
  const Spasehorizental({super.key, this.value});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize! * value!,
    );
  }
}

class Spasevertical extends StatelessWidget {
  const Spasevertical({super.key, this.value});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * value!,
    );
  }
}
