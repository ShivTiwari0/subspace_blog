class BlogModel {
  String? id;
  String? imageUrl;
  String? title;
  bool isFavorite;

  BlogModel({
    this.id,
    this.imageUrl,
    this.title,
    this.isFavorite = false,
  });

  BlogModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        imageUrl = json['image_url'],
        title = json['title'],
        isFavorite = false; // Initialize isFavorite to false by default

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['title'] = title;
    data['isFavorite'] = isFavorite;
    return data;
  }
}
