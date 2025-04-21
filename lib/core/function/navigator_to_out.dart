import 'package:flutter/material.dart';

Future<dynamic> navigatorToOut(BuildContext context, Widget view) {
  return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) {
    return view;
  }));
}
