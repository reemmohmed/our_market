import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themprovider with ChangeNotifier {
  static const String themStause = 'ThemDark';
  bool darkThem = false;
  bool get getIsDarkThem => darkThem;
  Themprovider() {
    getThem();
  }

  Future<void> setIsDarkTheem(bool isValue) async {
    SharedPreferences sharprf = await SharedPreferences.getInstance();
    sharprf.setBool(themStause, isValue);
    darkThem = isValue;
    notifyListeners();
  }

  Future<bool> getThem() async {
    SharedPreferences sharprf = await SharedPreferences.getInstance();
    darkThem = sharprf.getBool(themStause) ?? false;
    notifyListeners();
    return darkThem;
  }
}
