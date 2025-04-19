import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/app_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMassegeScaffold(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    backgroundColor: AppColors.kprimaryColoblue,
  ));
}
