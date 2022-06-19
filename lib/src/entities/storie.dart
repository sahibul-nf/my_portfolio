class Storie {
  String? title;
  String? feedTitle;
  String? link;
  String? logo;
  String? author;
  String? thumbnail;
  String? datePublished;
  List<String>? categories;

  Storie({
    required this.logo,
    required this.feedTitle,
    this.title,
    this.link,
    this.author,
    this.thumbnail,
    this.datePublished,
    this.categories,
  });
}
