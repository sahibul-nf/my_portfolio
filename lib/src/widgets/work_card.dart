import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahibullab/src/settings/app_theme.dart';
import 'package:sahibullab/src/widgets/app_card.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({
    Key? key,
    required this.techStack,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.owner,
    required this.color,
    required this.stars,
    required this.forks,
    required this.onTap,
  }) : super(key: key);

  final String techStack;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String owner;
  final String color;
  final String stars;
  final String forks;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Color? _color;
    if (color.isNotEmpty) {
      var fromHexaColor = color.replaceAll("#", "0xFF");

      _color = Color(int.parse(fromHexaColor));
    }

    String _title = title.replaceAll("_", " ").replaceAll("-", " ");
    _title = _title[0].toUpperCase() + _title.substring(1);

    _title.split(" ").forEach((word) {
      _title =
          _title.replaceAll(word, word[0].toUpperCase() + word.substring(1));
      _title.contains('Api')
          ? _title = _title.replaceAll('Api', 'API')
          : _title;
    });

    return Container(
      width: 320,
      // height: 450,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppShadow.card],
        border: Border.all(
          color: Colors.grey.shade100,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 26),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Image.asset("assets/images/my-snf.jpeg", width: 36),
              ),
              const SizedBox(width: 10),
              Text(
                owner,
                style: AppTextStyle.small,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _color?.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: SvgPicture.network(
                  techStack,
                  width: 18,
                  height: 18,
                  placeholderBuilder: (context) => Center(
                    child: SpinKitFadingCircle(
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _title,
            style: AppTextStyle.bigTitle,
            maxLines: 2,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: AppTextStyle.normal,
          ),
          const SizedBox(height: 16),
          AppCard(
            color: Theme.of(context).scaffoldBackgroundColor,
            hMargin: 0,
            vMargin: 0,
            hPadding: 8,
            vPadding: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: thumbnailUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SpinKitFadingCircle(
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.star_border,
                color: Colors.grey.shade500,
              ),
              const SizedBox(width: 4),
              Text(
                stars,
                style: AppTextStyle.small.copyWith(fontSize: 16),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.fork_left_rounded,
                color: Colors.grey.shade500,
              ),
              const SizedBox(width: 4),
              Text(
                forks,
                style: AppTextStyle.small.copyWith(fontSize: 16),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: _color!.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [AppShadow.card],
                  border: Border.all(
                    color: Colors.grey.shade100,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: InkWell(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Icon(
                        Icons.code,
                        color: _color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "View on Github",
                        style: AppTextStyle.small.copyWith(
                          color: _color,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class WorksCard extends StatelessWidget {
  const WorksCard(
      {Key? key,
      required this.thumbnail,
      required this.title,
      required this.shortDescription,
      required this.techStack,
      required this.color})
      : super(key: key);
  final String thumbnail;
  final String title;
  final String shortDescription;
  final String color;
  final List<String> techStack;

  String getTechImage(String tech) {
    switch (tech.toLowerCase()) {
      case "flutter":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/flutter-colored.svg";
      case "dart":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/dart-colored.svg";
      case "firebase":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/firebase-colored.svg";
      case "vue":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/vuejs-colored.svg";
      case "go":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/go-colored.svg";
      case "java":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/java-colored.svg";
      default:
        return "assets/images/2.0x/flutter_logo.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    Color? _color;
    if (color.isNotEmpty) {
      var fromHexaColor = color.replaceAll("#", "0xFF");

      _color = Color(int.parse(fromHexaColor));
    }

    return AppCard(
      hPadding: 8,
      vPadding: 8,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  thumbnail,
                  height: 280,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.6,
                  0.7,
                  0.8,
                ],
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Container(
            height: 280,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.bigTitle.copyWith(
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        shortDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.small.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (var item in techStack)
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: _color?.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: SvgPicture.network(
                              getTechImage(item),
                              width: 18,
                              height: 18,
                            )
                            // Image.asset(
                            //   item,
                            //   width: 18,
                            //   height: 18,
                            // ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
