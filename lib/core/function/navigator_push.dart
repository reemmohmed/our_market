import 'package:flutter/material.dart';

Future<dynamic> navigatorTo(BuildContext context, Widget pageView) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return pageView;
  }));
}
