import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sahibullab/src/controllers/stories_controller.dart';
import 'package:sahibullab/src/helpers/helpers.dart';
import 'package:sahibullab/src/settings/app_theme.dart';
import 'package:sahibullab/src/widgets/storie_card.dart';

class StorieDesktop extends StatelessWidget {
  StorieDesktop({Key? key}) : super(key: key);

  final controller = Get.put(StoriesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 140,
        horizontal: MediaQuery.of(context).size.width * 0.15,
      ),
      color: Colors.grey.shade100,
      child: Column(
        children: [
          Text(
            'My Stories',
            style: AppTextStyle.titleDesktop,
          ),
          Container(
            width: 70,
            height: 2,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 70),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              for (var item in controller.stories)
                StorieCardDesktop(
                  logoUrl: item.logo ?? "",
                  feedTitle: item.feedTitle ?? "",
                  title: item.title ?? "",
                  author: item.author ?? "",
                  pubDate: item.datePublished ?? "",
                  thumbnailUrl: item.thumbnail ?? "",
                  onTap: () => Helpers.launchURL(item.link.toString()),
                ),
            ],
          )
        ],
      ),
    );
  }
}
