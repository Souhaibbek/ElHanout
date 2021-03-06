import 'package:elhanout/logic/controller/themecontroller.dart';
import 'package:elhanout/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elhanout/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hanouti',
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode:
          ThemeController().getThemeData() ? ThemeMode.dark : ThemeMode.light,
      initialRoute: RoutesList.initialRoute,
      getPages: RoutesList.routes,
    );
  }
}
