import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:group_button/group_button.dart';
import 'package:sahibullab/src/settings/app_theme.dart';
import 'package:sahibullab/src/views/about_view.dart';
import 'package:sahibullab/src/views/links_view.dart';
import 'package:sahibullab/src/views/stories_view.dart';
import 'package:sahibullab/src/views/works_view.dart';

class NavItem extends StatelessWidget {
  const NavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupButton(
      buttons: const ["Links", "Works", "Stories", "About Me"],
      onSelected: (route, i, routeIs) {
        switch (i) {
          case 0:
            Get.toNamed(LinksView.routeName);
            break;
          case 1:
            Get.toNamed(WorksView.routeName);
            break;
          case 2:
            Get.toNamed(StoriesView.routeName);
            break;
          case 3:
            Get.toNamed(AboutView.routeName);
            break;
        }
      },
      options: GroupButtonOptions(
        spacing: 20,
        buttonHeight: 30,
        buttonWidth: 100,
        borderRadius: BorderRadius.circular(8),
        unselectedShadow: [],
        selectedShadow: [],
        unselectedBorderColor: Colors.white,
        selectedBorderColor: Colors.white,
        unselectedColor: Colors.white,
        selectedColor: Colors.white,
        unselectedTextStyle: AppTextStyle.normal.copyWith(
          color: ColorPalletes.bgDarkColor,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.6,
        ),
        selectedTextStyle: AppTextStyle.normal.copyWith(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
