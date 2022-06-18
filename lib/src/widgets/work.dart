import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sahibullab/src/controllers/works_controller.dart';
import 'package:sahibullab/src/helpers/helpers.dart';
import 'package:sahibullab/src/settings/app_theme.dart';
import 'package:sahibullab/src/widgets/work_card.dart';

class WorkDesktop extends StatelessWidget {
  WorkDesktop({Key? key}) : super(key: key);

  final controller = Get.put(WorksController());

  @override
  Widget build(BuildContext context) {
    // var item = controller.works[index];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 140,
        horizontal: MediaQuery.of(context).size.width * 0.15,
      ),
      child: Column(
        children: [
          Text(
            'My Works',
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
              for (var item in controller.works)
                WorkCardDesktop(
                  owner: item.owner!,
                  thumbnailUrl: item.imageUrl!,
                  title: item.title!,
                  description: item.description!,
                  color: item.techColor!,
                  techStack: item.techStack!,
                  stars: item.stars!,
                  forks: item.forks!,
                  toCode: () => Helpers.launchURL(item.link!),
                  toLive: () => Helpers.launchURL(item.website!),
                ),
            ],
          )
        ],
      ),
    );
  }
}
