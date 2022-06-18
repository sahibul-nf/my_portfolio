import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sahibullab/src/controllers/user_controller.dart';
import 'package:sahibullab/src/widgets/app_tabbar.dart';
import 'package:sahibullab/src/widgets/header.dart';
import 'package:sahibullab/src/widgets/nav_item.dart';
import 'package:sahibullab/src/widgets/tech_stack.dart';
import 'package:sahibullab/src/widgets/work.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../settings/app_theme.dart';

//  Delpoyment

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final controller = Get.put(UserController());
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => HomeMoible(controller: controller),
      tablet: (context) => HomeTablet(controller: controller),
      desktop: (context) => HomeDesktop(controller: controller),
    );
  }
}

class HomeMoible extends StatelessWidget {
  const HomeMoible({Key? key, required this.controller}) : super(key: key);
  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnappingSheet(
        grabbingHeight: 40,
        initialSnappingPosition: const SnappingPosition.factor(
          positionFactor: 0.5,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        snappingPositions: const [
          SnappingPosition.factor(
            positionFactor: 0.15,
            snappingCurve: Curves.easeOutExpo,
            snappingDuration: Duration(seconds: 1),
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
          SnappingPosition.factor(
            positionFactor: 0.9,
            snappingCurve: Curves.easeOutExpo,
            snappingDuration: Duration(seconds: 1),
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
        ],
        child: HeaderMobile(
          controller: controller,
        ),
        sheetBelow: SnappingSheetContent(
          draggable: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
              boxShadow: [AppShadow.card],
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const TabBarAndTabViews(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key, required this.controller}) : super(key: key);
  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              child: Container(
                height: 70,
                width: 140,
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () => Get.toNamed(HomeView.routeName),
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
            ),
            actions: [
              const NavItem(),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                HeaderDesktop(controller: controller),
                const TechStackDesktop(),
                WorkDesktop(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key, required this.controller}) : super(key: key);
  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnappingSheet(
        grabbingHeight: 40,
        initialSnappingPosition: const SnappingPosition.factor(
          positionFactor: 0.5,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        snappingPositions: const [
          SnappingPosition.factor(
            positionFactor: 0.15,
            snappingCurve: Curves.easeOutExpo,
            snappingDuration: Duration(seconds: 1),
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
          SnappingPosition.factor(
            positionFactor: 0.9,
            snappingCurve: Curves.easeOutExpo,
            snappingDuration: Duration(seconds: 1),
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
        ],
        child: HeaderMobile(controller: controller),
        sheetBelow: SnappingSheetContent(
          draggable: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
              boxShadow: [AppShadow.card],
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const TabBarAndTabViews(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
