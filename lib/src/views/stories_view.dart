import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sahibullab/src/controllers/stories_controller.dart';
import 'package:sahibullab/src/widgets/storie_card.dart';

class StoriesView extends StatelessWidget {
  StoriesView({Key? key}) : super(key: key);

  final controller = Get.put(StoriesController());

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => ListView.separated(
        // physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          var item = controller.stories[index];

          return InkWell(
            onTap: () => controller.launchStorie(item.link.toString()),
            child: StorieCard(
              logoUrl: item.logo ?? "",
              title: item.title ?? "",
              author: item.author ?? "",
              pubDate: item.datePublished ?? "",
              thumbnailUrl: item.thumbnail ?? "",
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },

        itemCount: controller.stories.length,
      ),
      desktop: (context) => Obx(
        () => controller.isLoading.value
            ? Center(
                child: SpinKitFadingCircle(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                runSpacing: 20,
                spacing: 20,
                children: [
                  for (var item in controller.stories)
                    InkWell(
                      onTap: () =>
                          controller.launchStorie(item.link.toString()),
                      child: StorieCard(
                        logoUrl: item.logo ?? "",
                        title: item.title ?? "",
                        author: item.author ?? "",
                        pubDate: item.datePublished ?? "",
                        thumbnailUrl: item.thumbnail ?? "",
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
