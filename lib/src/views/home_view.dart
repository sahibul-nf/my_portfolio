import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sahibullab/src/controllers/user_controller.dart';
import 'package:sahibullab/src/helpers/helpers.dart';
import 'package:sahibullab/src/widgets/app_tabbar.dart';

import '../settings/app_theme.dart';

//  Delpoyment

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 120),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [AppShadow.card],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 140,
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Obx(
                          () => controller.isLoading.value
                              ? Center(
                                  child: SpinKitFadingCircle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/images/my-snf.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                  imageUrl: controller.user.value.avatarUrl
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => controller.isLoading.value
                          ? Center(
                              child: SpinKitThreeBounce(
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                            )
                          : Text(
                              "👋  hi, I am ${controller.user.value.name?.split(' ').first}",
                              style: AppTextStyle.title,
                              textAlign: TextAlign.center,
                            ),
                    ),
                    const SizedBox(height: 6),
                    Obx(
                      () => controller.isLoading.value
                          ? Center(
                              child: SpinKitThreeBounce(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                size: 20,
                              ),
                            )
                          : Text(
                              "Software Developer",
                              style: AppTextStyle.small.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                    ),
                    const SizedBox(height: 60),
                    InkWell(
                      onTap: () => Helpers.launchURL(
                          "https://api.whatsapp.com/send?phone=6282370083327"),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(1.0),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [AppShadow.card],
                          border: Border.all(
                            color: Colors.grey.shade100,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Text(
                          "💬  Whatsapp",
                          style: AppTextStyle.normal.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.55,
                maxChildSize: 0.9,
                minChildSize: 0.4,
                snap: true,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                      boxShadow: [AppShadow.card],
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const TabBarAndTabViews(),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      desktop: (context) => Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [AppShadow.card],
                borderRadius: BorderRadius.circular(30),
              ),
              height: 140,
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Obx(
                  () => controller.isLoading.value
                      ? Center(
                          child: SpinKitFadingCircle(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : CachedNetworkImage(
                          errorWidget: (context, url, error) => Image.asset(
                            "assets/images/my-snf.jpeg",
                            fit: BoxFit.cover,
                          ),
                          imageUrl: controller.user.value.avatarUrl.toString(),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: SpinKitThreeBounce(
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                    )
                  : Text(
                      "👋  hi, I am ${controller.user.value.name?.split(' ').first}",
                      style: AppTextStyle.title,
                      textAlign: TextAlign.center,
                    ),
            ),
            const SizedBox(height: 6),
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: SpinKitThreeBounce(
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        size: 20,
                      ),
                    )
                  : Text(
                      "Software Developer",
                      style: AppTextStyle.small.copyWith(
                        color: Colors.grey,
                      ),
                    ),
            ),
            const SizedBox(height: 60),
            InkWell(
              onTap: () => Helpers.launchURL(
                  "https://api.whatsapp.com/send?phone=6282370083327"),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(1.0),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [AppShadow.card],
                  border: Border.all(
                    color: Colors.grey.shade100,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: Text(
                  "💬  Whatsapp",
                  style: AppTextStyle.normal.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      tablet: (context) => Container(),
    );
  }
}
