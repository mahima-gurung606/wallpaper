import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/wallpaper/model.dart';

class FullScreenImage extends StatelessWidget {
  FullScreenImage({
    Key? key,
  }) : super(key: key);
  final WallpaperClass photo = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.black,
        title: Text(
          'Full Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Center(
          child: Hero(
            tag: 'fullscreen-image',
            child: Image.network(
              photo.imgurl,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
