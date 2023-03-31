import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Image Picker',
      themeMode: ThemeMode.system,
      home: const HomepageScreen(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
