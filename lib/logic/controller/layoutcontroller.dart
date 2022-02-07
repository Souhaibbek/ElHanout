import 'package:elhanout/utils/theme.dart';
import 'package:elhanout/view/screens/category.dart';
import 'package:elhanout/view/screens/favorite.dart';
import 'package:elhanout/view/screens/home.dart';
import 'package:elhanout/view/screens/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LayoutController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ].obs;

  List<String> titles = [
    'Home',
    'Categories',
    'Favorites',
    'Settings',
  ].obs;

  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.home,
        color: Get.isDarkMode ? pinkClr : mainColor,
      ),
      icon: Icon(
        Icons.home,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.category,
        color: Get.isDarkMode ? pinkClr : mainColor,
      ),
      icon: Icon(
        Icons.category,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.favorite,
        color: Get.isDarkMode ? pinkClr : mainColor,
      ),
      icon: Icon(
        Icons.favorite,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.settings,
        color: Get.isDarkMode ? pinkClr : mainColor,
      ),
      icon: Icon(
        Icons.settings,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      label: '',
    ),
  ];
}