import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sahibullab/src/helpers/helpers.dart';
import 'package:sahibullab/src/settings/app_theme.dart';
import 'package:sahibullab/src/views/home_view.dart';
import 'package:sahibullab/src/widgets/app_card.dart';
import 'package:sahibullab/src/widgets/nav_item.dart';

import '../controllers/user_controller.dart';

class AboutView extends StatelessWidget {
  AboutView({Key? key}) : super(key: key);

  final controller = Get.put(UserController());
  static const routeName = "/about";

  @override
  Widget build(BuildContext context) {
    List<String> techStack = [];

    for (var item in Helpers.techStack) {
      var v = Helpers.getTechImage(item);
      techStack.add(v);
    }

    return ScreenTypeLayout.builder(
      mobile: (context) => AboutMobile(
        controller: controller,
        techStack: techStack,
      ),
    );
  }
}

class AboutMobile extends StatelessWidget {
  const AboutMobile(
      {Key? key, required this.controller, required this.techStack})
      : super(key: key);
  final UserController controller;
  final List<String> techStack;

  @override
  Widget build(BuildContext context) {
    return controller.isLoading.value
        ? SpinKitFadingCircle(
            color: Theme.of(context).primaryColor,
          )
        : SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: getValueForScreenType<double>(
                context: context,
                mobile: 20,
                tablet: 80,
                desktop: MediaQuery.of(context).size.width * 0.2,
              ),
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: AppTextStyle.bigTitle,
                ),
                const SizedBox(height: 10),
                AppCard(
                  hMargin: 0,
                  radius: 16,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    controller.user.value.about!,
                    style: AppTextStyle.normal,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        height: 110,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [AppShadow.card],
                          // border: Border.all(
                          //   color: Colors.grey.shade100,
                          // ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Column(
                          children: [
                            const Icon(IconlyLight.location),
                            const SizedBox(height: 10),
                            Text(
                              controller.user.value.location!,
                              style: AppTextStyle.small,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 110,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [AppShadow.card],
                          // border: Border.all(
                          //   color: Colors.grey.shade100,
                          // ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Column(
                          children: [
                            const Icon(IconlyLight.user_1),
                            const SizedBox(height: 10),
                            Text(
                              controller.user.value.followers! + "  followers",
                              style: AppTextStyle.small,
                            ),
                            Text(
                              controller.user.value.following! + "  following",
                              style: AppTextStyle.small,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 110,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [AppShadow.card],
                          // border: Border.all(
                          //   color: Colors.grey.shade100,
                          // ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Column(
                          children: [
                            const Icon(IconlyLight.activity),
                            const SizedBox(height: 10),
                            Text(
                              controller.user.value.repoCount! + "  repos",
                              style: AppTextStyle.small,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Tech Stack",
                  style: AppTextStyle.bigTitle,
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var item in techStack)
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: SvgPicture.network(
                          item,
                          width: 30,
                          height: 30,
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
                const SizedBox(height: 70),
                AppCard(
                  child: InkWell(
                    onTap: () =>
                        Helpers.launchURL(controller.user.value.github!),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.code,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "View more on Github",
                          style: AppTextStyle.normal.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
