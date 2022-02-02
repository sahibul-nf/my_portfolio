import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:my_portfolio/src/home/controller/home_controller.dart';
import 'package:my_portfolio/src/settings/theme/app_theme.dart';
import 'package:my_portfolio/src/widgets/my_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';
  late ScrollController _scrollController;
  final _homeController = HomeController();

  void changeAppBarState() {
    if (_scrollController.offset > 50) {
      _homeController.changeOpacity(_scrollController.offset / 100 > 1.0
          ? 1.0
          : _scrollController.offset / 100);
    } else if (_scrollController.offset <= 50) {
      _homeController.changeOpacity(_scrollController.offset / 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(changeAppBarState);

    return AnimatedBuilder(
      animation: _homeController,
      builder: (context, child) {
        return Scaffold(
          // appBar:
          body: SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    height: 900,
                    width: 900,
                    top: -110,
                    left: -420,
                    child: SvgPicture.asset(
                      "assets/item2.svg",
                      color: ColorPalletes.bgGrayColor,
                    ),
                  ),
                  Positioned(
                    height: 120,
                    width: 120,
                    top: 20,
                    left: 850,
                    child: SvgPicture.asset(
                      "assets/item2.svg",
                      color: ColorPalletes.bgGrayColor,
                    ),
                  ),
                  Positioned(
                    height: 40,
                    width: 40,
                    top: 100,
                    left: 430,
                    child: SvgPicture.asset(
                      "assets/item2.svg",
                      color: ColorPalletes.bgLightColor,
                    ),
                  ),
                  Positioned(
                    height: 60,
                    width: 60,
                    top: 170,
                    left: 1130,
                    child: SvgPicture.asset(
                      "assets/item2.svg",
                      color: ColorPalletes.bgLightColor,
                    ),
                  ),
                  Positioned(
                    height: 60,
                    width: 60,
                    top: 470,
                    left: 530,
                    child: SvgPicture.asset(
                      "assets/item2.svg",
                      color: ColorPalletes.bgLightColor,
                    ),
                  ),
                  Positioned(
                    height: 190,
                    width: 190,
                    top: 320,
                    left: 1130,
                    child: SvgPicture.asset(
                      "assets/item2.svg",
                      color: ColorPalletes.bgGrayColor,
                    ),
                  ),

                  // Header
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 170),
                      width: MediaQuery.of(context).size.width * 0.7,
                      // color: Colors.black12.withOpacity(1.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hi, I'm Sahibul",
                                        style: AppTextStyle.bigTitle,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "Flutter Developer",
                                        style: AppTextStyle.normal.copyWith(
                                          fontSize: 24,
                                          color: ColorPalletes.blackFont
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "Through constant practice & learning, I produce aesthetic software to an extremely high standard.",
                                        style: AppTextStyle.normal.copyWith(
                                            color: ColorPalletes.blackFont
                                            // .withOpacity(0.8),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/avatar-bg.svg",
                                        color: ColorPalletes.primaryColor,
                                        height: 250,
                                        width: 250,
                                      ),
                                      Positioned(
                                        top: -5,
                                        child: Image.asset(
                                          "assets/images/avatar.png",
                                          height: 250,
                                          width: 250,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Footer

                  // AppBar
                  MyAppBar(),
                ],
              ),
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(IconlyBroken.add_user),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(IconlyBroken.add_user),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
        );
      },
    );
  }
}
