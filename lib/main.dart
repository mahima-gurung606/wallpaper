import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/wallpaper/wallpaperdetail.dart';
import 'package:wallpaper/wallpaper/wallpaperhome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => Wallpaperhome()),
        GetPage(name: "/wallpaperdetails", page: () => ImageDetailPage()),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
