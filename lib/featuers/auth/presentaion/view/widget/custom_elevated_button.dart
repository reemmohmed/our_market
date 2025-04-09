import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/widgets/app_colors.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
  });
  final String text;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
            elevation: 3,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.lightScaffold),
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: backgroundColor ?? AppColors.kprimaryColoblue,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.lightScaffold,
            ),
          )),
    );
  }
}

class CustomElevatedIcon extends StatelessWidget {
  const CustomElevatedIcon(
      {super.key,
      required this.text,
      this.backgroundColor,
      this.onPressed,
      this.icon});
  final String text;
  final Color? backgroundColor;
  final IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
            elevation: 3,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.lightScaffold),
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: backgroundColor ?? AppColors.kprimaryColoblue,
          ),
          icon: Icon(
            icon ?? Ionicons.logo_google,
            color: Colors.white,
          ),
          onPressed: onPressed,
          label: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.lightScaffold,
            ),
          )),
    );
  }
}

class CustomElevateGenaric extends StatelessWidget {
  const CustomElevateGenaric({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kprimaryColoblue),
        onPressed: onPressed,
        child: TitelTextWidget(
          text: text,
          color: Colors.white,
        ));
  }
}
