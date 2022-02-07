import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage storage = GetStorage();
  final key = 'isDarkMode';

  saveThemeData(bool isDark) {
    storage.write(key, isDark);
  }

  bool getThemeData() {
    return storage.read<bool>(key) ?? false;
  }

  void changesTheme() {
    Get.changeThemeMode(
        getThemeData() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!getThemeData());
  }
}