import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahibullab/src/helpers/helpers.dart';
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

class WorkCardDesktop extends StatelessWidget {
  const WorkCardDesktop({
    Key? key,
    required this.techStack,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.owner,
    required this.color,
    required this.stars,
    required this.forks,
    required this.toCode,
    required this.toLive,
  }) : super(key: key);
  final String techStack;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String owner;
  final String color;
  final String stars;
  final String forks;
  final void Function() toCode;
  final void Function() toLive;

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
      // height: MediaQuery.of(context).size.height * 0.5,
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [AppShadow.card],
        border: Border.all(
          color: Colors.grey.shade100,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Helpers.getCoverImage(_title) != null
                ? Image.asset(
                    Helpers.getCoverImage(_title)!,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: thumbnailUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: SpinKitFadingCircle(
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      thumbnailUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: AppTextStyle.bigTitle.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  // color: Colors.amber,
                  height: 70,
                  child: Text(
                    description,
                    style: AppTextStyle.smallDesktop,
                    textAlign: TextAlign.left,
                  ),
                ),
                // const SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: _color?.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.network(
                            Helpers.getTechImage(techStack),
                            width: 18,
                            height: 18,
                            placeholderBuilder: (context) => Center(
                              child: SpinKitFadingCircle(
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            techStack,
                            style: AppTextStyle.small.copyWith(
                              color: _color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star_border,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      stars,
                      style: AppTextStyle.small.copyWith(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.fork_left_rounded,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      forks,
                      style: AppTextStyle.small.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // color: _color!.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [AppShadow.card],
                        // border: Border.all(
                        //   color: Colors.grey.shade100,
                        // ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      child: InkWell(
                        onTap: toCode,
                        child: Row(
                          children: [
                            // Icon(
                            //   Icons.code,
                            //   color: _color,
                            // ),
                            // const SizedBox(width: 4),
                            Text(
                              "View Code",
                              style: AppTextStyle.small.copyWith(
                                color: _color,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: toLive,
                      child: Container(
                        decoration: BoxDecoration(
                          color: _color,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [AppShadow.card],
                          // border: Border.all(
                          //   color: Colors.grey.shade100,
                          // ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Text(
                          "🚀  Live",
                          style: AppTextStyle.normal.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
