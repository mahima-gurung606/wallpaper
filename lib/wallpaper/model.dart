class WallpaperClass {
  String imgurl;
  String name;
  String color;
  String alt;

  WallpaperClass({
    required this.name,
    required this.imgurl,
    required this.color,
    required this.alt,
  });

  factory WallpaperClass.fromMap(Map<String, dynamic> map) {
    return WallpaperClass(
      name: map['photographer'],
      imgurl: map['src']['portrait'],
      color: map['avg_color'],
      alt: map['alt'],
    );
  }
}
