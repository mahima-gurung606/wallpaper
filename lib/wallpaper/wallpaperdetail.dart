// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:wallpaper/wallpaper/model.dart';
//
// class Wallpaperdetail extends StatefulWidget {
//   Wallpaperdetail({super.key});
//
//   @override
//   State<Wallpaperdetail> createState() => _WallpaperdetailState();
// }
//
// class _WallpaperdetailState extends State<Wallpaperdetail> {
//   @override
//   Widget build(BuildContext context) {
//     final WallpaperClass photo = Get.arguments;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         iconTheme: IconThemeData(
//           color: Colors.white, // Set the color of the back arrow to white
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios,
//               color: Colors.white), // Custom back icon
//           onPressed: () {
//             Get.back(); // Navigating back
//           },
//         ),
//         title: Text(
//           'WallPics',
//           style: TextStyle(
//               fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Expanded(
//                 flex: 3,
//                 child: Stack(
//                   alignment: Alignment.topRight,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           image: DecorationImage(
//                               image: NetworkImage('${photo.imgurl}'),
//                               fit: BoxFit.cover)),
//                     ),
//                     Positioned(
//                         right: 10,
//                         top: 10,
//                         child: Container(
//                           alignment: Alignment.center,
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Icon(
//                             Icons.fullscreen,
//                             size: 40,
//                           ),
//                         ))
//                   ],
//                 )),
//             Expanded(
//               flex: 2,
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 width: MediaQuery.of(context).size.width,
//                 // color: Colors.teal,
//                 child: Text(
//                   '${photo.alt}',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     Icon(
//                       Icons.person,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 22,
//             ),
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     Icon(
//                       Icons.camera_alt,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/wallpaper/model.dart';
import 'package:wallpaper/wallpaper/services.dart';

class ImageDetailPage extends StatelessWidget {
  final WallpaperClass photo = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Image Detail',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: '${photo.imgurl}',
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(photo.imgurl)),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    height: 45,
                    width: 45,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/full_screen', arguments: photo);
                      },
                      child: Icon(
                        Icons.fullscreen,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      photo.alt,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      photo.name,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Text(
                        'DreamLense Production',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Photo by',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Text(
                        '  pixel  ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: Colors.white,
              height: 50,
              minWidth: 20,
              onPressed: () {
                WallpaperServices().openUrl(photo.imgurl);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Download'), Icon(Icons.download)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
