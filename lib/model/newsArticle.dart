class NewsArticle {
  String title;
  String publishedAt;
  String description;
  String url;
  String urlToImage;
  NewsArticle(
      {this.title,
      this.description,
      this.publishedAt,
      this.url,
      this.urlToImage});
  // Tutorial https://youtu.be/_j7blnkLAdI
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }
}
