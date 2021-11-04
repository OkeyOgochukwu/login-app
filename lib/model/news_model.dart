class News {
  final String link;
  final String title;
  final String published;

  News({
    required this.link,
    required this.title,
    required this.published,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        link: json['link'],
        title: json['title'].toString(),
        published: json['published']);
  }
}
