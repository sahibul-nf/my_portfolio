class Storie {
  String? title;
  String? link;
  String? logo;
  String? author;
  String? thumbnail;
  String? datePublished;
  List<String>? categories;

  Storie({
    required this.logo,
    this.title,
    this.link,
    this.author,
    this.thumbnail,
    this.datePublished,
    this.categories,
  });
}
