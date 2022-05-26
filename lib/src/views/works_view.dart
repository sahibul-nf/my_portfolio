import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sahibullab/src/controllers/works_controller.dart';
import 'package:sahibullab/src/helpers/helpers.dart';
import 'package:sahibullab/src/widgets/work_card.dart';

class WorksView extends StatelessWidget {
  WorksView({Key? key}) : super(key: key);

  final controller = Get.put(WorksController());
  static const routeName = "/works";

  @override
  Widget build(BuildContext context) {
    var hPadding = getValueForScreenType<double>(
      context: context,
      mobile: 20,
      tablet: 80,
      desktop: 60,
    );
    return ListView.separated(
      // physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
      itemBuilder: (context, index) {
        var item = controller.works[index];

        return WorkCard(
          owner: item.owner!,
          thumbnailUrl: item.imageUrl!,
          title: item.title!,
          description: item.description!,
          color: item.techColor!,
          techStack: Helpers.getTechImage(item.techStack!),
          stars: item.stars!,
          forks: item.forks!,
          onTap: () => Helpers.launchURL(item.link!),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: controller.works.length,
    );
  }
}
