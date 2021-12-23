import 'package:demo2/pages/home_page.dart';
import 'package:demo2/pages/login_page.dart';
import 'package:demo2/routes.dart';
import 'package:demo2/widgit/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      theme: MyThemes.lightThemData(),
      themeMode: ThemeMode.light,
      darkTheme: MyThemes.darkThemData(),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
