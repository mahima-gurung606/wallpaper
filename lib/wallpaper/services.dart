import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper/wallpaper/model.dart';

class WallpaperServices {
  String _baseUrl = 'https://api.pexels.com/v1/';
  final _key = 'nVyi0yVUeGEbTyml1rZO549mLvZnvjTvx9ShZUsQuGwL3uFAuXTiXQCq';

  Future<List<WallpaperClass>> fetchWallpaperData(String category) async {
    try {
      final url = "${_baseUrl}search?query=${category}&per_page=33";
      final response =
          await http.get(Uri.parse(url), headers: {"Authorization": _key});
      final allData = jsonDecode(response.body);
      final List data = allData["photos"];
      return data.map((photo) => WallpaperClass.fromMap(photo)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> openUrl(String imgUrl) async {
    final Uri _url = Uri.parse(imgUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
