import 'package:campus_camaraderie_web/constants/theme_constants.dart';
import 'package:campus_camaraderie_web/pages/login/component/login_component.dart';
import 'package:campus_camaraderie_web/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Campus-Camaraderie',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      theme: ThemeConstants.LightTheme,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: child!,
      ),
      initialRoute: '/',
      home: LoginComponent(),
    );
  }
}


