class RadioStation {
  final String title;
  final String imageUrl;
  final String url;
  bool isFavorite;

  RadioStation(
      {required this.imageUrl,
      required this.title,
      required this.url,
      this.isFavorite = false});

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': this.imageUrl,
      'title': this.title,
      'url': this.url,
      'isFavorite': this.isFavorite,
    };
  }
}
