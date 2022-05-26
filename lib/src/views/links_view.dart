import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sahibullab/src/entities/link.dart';
import 'package:sahibullab/src/widgets/app_card.dart';
import 'package:sahibullab/src/widgets/nav_item.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../settings/app_theme.dart';

class LinksView extends StatelessWidget {
  LinksView({Key? key}) : super(key: key);
  static const routeName = "/links";

  final List<Link> links = [
    Link(null, "🤩 hiQuran",
        "https://play.google.com/store/apps/details?id=com.sahibul_nf.quran_app"),
    Link(UniconsLine.file_alt, "Resume",
        "https://glints.com/id/profile/public/38a2da19-c39e-4878-a1d3-0891af0b2079"),
    Link(UniconsLine.github, "Github 1th", "https://github.com/sahibul-nf/"),
    Link(UniconsLine.github, "Github 2th", "https://github.com/sahibul-n-f/"),
    Link(UniconsLine.youtube, "Youtube",
        "https://www.youtube.com/channel/UCdWVhgD6M7D5DhwT0jfFITw"),
    Link(UniconsLine.linkedin, "LinkedIn",
        "https://www.linkedin.com/in/sahibul-nf/"),
    Link(UniconsLine.instagram, "Instagram",
        "https://instagram.com/sahibul_nf/"),
  ];

  Future<String> _launch(String? link) async {
    if (link != null) {
      if (!await launch(link)) {
        Get.snackbar("Opps", "Can not launch $link");
        return "Can not launch $link";
      }

      return "";
    }
    return "Link not exist";
  }

  @override
  Widget build(BuildContext context) {
    var hPadding = getValueForScreenType<double>(
      context: context,
      mobile: 20,
      tablet: 80,
      desktop: 60,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DeviceScreenType.desktop == ScreenType.Desktop
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1),
                child: Container(
                  height: 70,
                  width: 140,
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        SvgPicture.asset(
                          "assets/item2.svg",
                          color:
                              Theme.of(context).primaryColor.withOpacity(1.0),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Sahi ",
                            style: AppTextStyle.title.copyWith(
                              color: ColorPalletes.bgDarkColor,
                            ),
                            children: [
                              TextSpan(
                                text: " bul",
                                style: AppTextStyle.title.copyWith(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                const NavItem(),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              ],
            )
          : null,
      body: ListView.separated(
        // physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _launch(links[index].links).then((value) {
                log(value.toString());
                if (value.isNotEmpty) {
                  Get.snackbar("Opps", value);
                }
              });
            },
            child: AppCard(
              hMargin: 0,
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (links[index].icon != null)
                    Icon(
                      (links[index].icon == null) ? null : links[index].icon,
                      // color: Colors.white,
                      color: Theme.of(context).primaryColor,
                    ),
                  const SizedBox(width: 10),
                  Text(
                    links[index].content!,
                    style: AppTextStyle.normal.copyWith(
                      // color: Colors.white,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  // const Spacer(),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: links.length,
      ),
    );
  }
}
