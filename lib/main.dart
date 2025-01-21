import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:greemgrocer/src/config/custom_colors.dart';
import 'package:greemgrocer/src/pages_routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'greengrocer',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: CustomColor.customSwatchColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages,
    );
  }
}
