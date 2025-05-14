import 'package:flutter/material.dart';
import 'package:get/get.dart';

simpleAppBarWidget(
  BuildContext context,
  String title,
) {
  return AppBar(
    elevation: 4,
    // iconTheme: Theme.of(context).iconTheme,
    centerTitle: true,
    title: Text(title,
        style: context.theme.textTheme.bodyMedium!
            .copyWith(fontWeight: FontWeight.bold)),
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
        icon: Icon(Icons.light_mode),
        onPressed: () {
          Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
        },
      ),
    ],
  );
}
