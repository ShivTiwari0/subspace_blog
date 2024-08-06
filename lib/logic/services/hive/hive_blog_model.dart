import 'package:hive/hive.dart';

part 'hive_blog_model.g.dart';

@HiveType(typeId: 0)
class HiveBlogModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? imageUrl;

  @HiveField(2)
  String? title;

  @HiveField(3)
  bool? isFavorite;

  HiveBlogModel({this.id, this.imageUrl, this.title, this.isFavorite = false});

  factory HiveBlogModel.fromJson(Map<String, dynamic> json) {
    return HiveBlogModel(
      id: json['id'],
      imageUrl: json['image_url'],
      title: json['title'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'title': title,
      'isFavorite': isFavorite,
    };
  }
}
