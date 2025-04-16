import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustomListTitel extends StatelessWidget {
  const CustomListTitel({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final IconData icon;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(icon),
            title: TitelTextWidget(text: text),
            trailing: const Icon(Ionicons.chevron_forward),
            onTap: onTap,
          ),
        ));
  }
}
