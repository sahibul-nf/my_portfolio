class PinnedGithubRepo {
  PinnedGithubRepo({
    required this.owner,
    required this.repo,
    required this.link,
    required this.description,
    required this.image,
    required this.website,
    required this.language,
    required this.languageColor,
    required this.stars,
    required this.forks,
  });
  late final String owner;
  late final String repo;
  late final String link;
  late final String description;
  late final String image;
  late final String website;
  late final String language;
  late final String languageColor;
  late final String stars;
  late final String forks;

  PinnedGithubRepo.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    repo = json['repo'];
    link = json['link'];
    description = json['description'];
    image = json['image'];
    website = json['website'] ?? "";
    language = json['language'];
    languageColor = json['languageColor'];
    stars = json['stars'].toString();
    forks = json['forks'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['owner'] = owner;
    _data['repo'] = repo;
    _data['link'] = link;
    _data['description'] = description;
    _data['image'] = image;
    _data['website'] = website;
    _data['language'] = language;
    _data['languageColor'] = languageColor;
    _data['stars'] = stars;
    _data['forks'] = forks;
    return _data;
  }
}
