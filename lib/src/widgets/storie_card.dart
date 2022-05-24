import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sahibullab/src/settings/app_theme.dart';
import 'package:sahibullab/src/widgets/app_card.dart';

class StorieCard extends StatelessWidget {
  const StorieCard(
      {Key? key,
      required this.logoUrl,
      required this.title,
      required this.pubDate,
      required this.thumbnailUrl,
      required this.author})
      : super(key: key);

  final String logoUrl;
  final String title;
  final String pubDate;
  final String thumbnailUrl;
  final String author;

  bool isNewStorie(DateTime pubDate) {
    var timeNow = DateTime.now();

    bool isSameMonth = timeNow.month == pubDate.month;
    bool isSameYear = timeNow.year == pubDate.year;

    return isSameYear && isSameMonth;
  }

  @override
  Widget build(BuildContext context) {
    bool isNew = isNewStorie(DateTime.parse(pubDate));

    return Container(
      width: 320,
      height: 460,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
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
          const SizedBox(height: 16),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: logoUrl == ""
                    ? Image.asset("assets/images/my-snf.jpeg")
                    : CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/my-snf.jpeg"),
                        placeholder: (context, url) =>
                            Image.asset("assets/images/my-snf.jpeg"),
                        imageUrl: logoUrl,
                        width: 36,
                      ),
              ),
              const SizedBox(width: 10),
              Text(
                author,
                style: AppTextStyle.small,
                overflow: TextOverflow.ellipsis,
              ),
              (isNew) ? const Spacer() : const SizedBox(),
              (isNew)
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        boxShadow: [AppShadow.card],
                      ),
                      child: Text(
                        "New",
                        style: AppTextStyle.normal.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyle.bigTitle,
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          // const Spacer(),
          Text(
            pubDate,
            style: AppTextStyle.small,
          ),
          const SizedBox(height: 10),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                thumbnailUrl,
                height: 200,
                width: double.infinity,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              )
              // CachedNetworkImage(
              //   placeholder: (context, url) => Image.asset(
              //     "assets/images/Group 1.png",
              //     fit: BoxFit.cover,
              //   ),
              //   imageUrl:
              //       "https://cdn-images-1.medium.com/max/1024/0*hB6T-lilpcaIf-y4",
              // height: 200,
              // width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              ),
          const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     IconButton(
          //       padding: const EdgeInsets.all(0),
          //       onPressed: () {},
          //       icon: Container(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 10,
          //           vertical: 5,
          //         ),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: Colors.red.shade100,
          //           boxShadow: [AppShadow.card],
          //         ),
          //         child: Text(
          //           "🚀",
          //           style: AppTextStyle.bigTitle,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 10),
          //     IconButton(
          //       padding: const EdgeInsets.all(0),
          //       onPressed: () {},
          //       icon: Container(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 10,
          //           vertical: 5,
          //         ),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: Colors.orange.shade100,
          //           boxShadow: [AppShadow.card],
          //         ),
          //         child: Text(
          //           "🔥",
          //           style: AppTextStyle.bigTitle,
          //         ),
          //       ),
          //     ),
          //     const Spacer(),
          //     IconButton(
          //       padding: const EdgeInsets.all(0),
          //       onPressed: () {},
          //       icon: Container(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 10,
          //           vertical: 5,
          //         ),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: Colors.blue.shade100,
          //           boxShadow: [AppShadow.card],
          //         ),
          //         child: Text(
          //           "📁",
          //           style: AppTextStyle.bigTitle,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
