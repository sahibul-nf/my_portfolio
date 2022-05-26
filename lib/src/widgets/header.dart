import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sahibullab/src/controllers/user_controller.dart';
import 'package:sahibullab/src/helpers/helpers.dart';
import 'package:sahibullab/src/settings/app_theme.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({Key? key, required this.controller}) : super(key: key);
  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black12,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "hi 👋, I am Sahibul",
                  style: AppTextStyle.bigTitle.copyWith(
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  "Software Developer",
                  style: AppTextStyle.normal.copyWith(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => controller.isLoading.value
                      ? SizedBox(
                          child: SpinKitThreeBounce(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            size: 20,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.15,
                          ),
                          child: Text(
                            controller.user.value.about!,
                            style: AppTextStyle.small.copyWith(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () => Helpers.launchURL(
                      "https://api.whatsapp.com/send?phone=6282370083327"),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(1.0),
                      borderRadius: BorderRadius.circular(15),
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
                ),
              ],
            ),
          ),
          Container(
            // margin: const EdgeInsets.only(top: 120),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [AppShadow.card],
              borderRadius: BorderRadius.circular(30),
            ),
            height: 200,
            width: 200,
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
        ],
      ),
    );
  }
}

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({Key? key, required this.controller}) : super(key: key);
  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
