import 'package:flutter/material.dart';

Future<dynamic> navigatorpush(BuildContext context, Widget pageView) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return pageView;
  }));
}
