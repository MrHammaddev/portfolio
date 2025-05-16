import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:portfolio/Screens/Home/home.dart';
import 'Config/Theme/app_theme.dart';
import 'Config/Theme/theme_service.dart';
import 'Screens/Home/desktop.dart';

void main() async {
  // runApp(
  //   DevicePreview(
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: Themes.dark,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        home: HomeScreen());
  }
}
