import 'package:flutter/material.dart';

Future<dynamic> ShowDialog2(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Remove Item"),
      content: const Text("Are you sure you want to remove this item?"),
      actions: [
        TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context)),
        TextButton(
          child: const Text("Remove", style: TextStyle(color: Colors.red)),
          onPressed: () {
            // إزالة المنتج من السلة
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
