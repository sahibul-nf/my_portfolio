import 'package:flutter/material.dart';
import 'package:sahibullab/src/widgets/app_tabbar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../settings/app_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // late ScrollController _scrollController;

  // void changeAppBarState() {
  //   if (_scrollController.offset > 50) {
  //     _homeController.changeOpacity(_scrollController.offset / 100 > 1.0
  //         ? 1.0
  //         : _scrollController.offset / 100);
  //   } else if (_scrollController.offset <= 50) {
  //     _homeController.changeOpacity(_scrollController.offset / 100);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // _scrollController = ScrollController(
    //     initialScrollOffset: _homeController.initialScrollOffset);
    // _scrollController.addListener(changeAppBarState);

    // return AnimatedBuilder(
    //   animation: _homeController,
    //   builder: (context, child) {
    //     return Scaffold(
    //       backgroundColor: ColorPalletes.bgDarkColor,
    //       // appBar:
    //       body: SingleChildScrollView(
    //         controller: _scrollController,
    //         child: SizedBox(
    //           height: MediaQuery.of(context).size.height,
    //           width: MediaQuery.of(context).size.width,
    //           child: ListView(
    //             children: [
    //               // AppBar
    //               MyAppBar(),

    //               // Header
    //               const HomeHeader(),

    //               SizedBox(
    //                 height: 500,
    //                 width: MediaQuery.of(context).size.width,
    //               ),

    //               // Footer
    //             ],
    //           ),
    //         ),
    //       ),
    //       floatingActionButton: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           IconButton(
    //             onPressed: () {},
    //             icon: const Icon(IconlyBroken.add_user),
    //           ),
    //           IconButton(
    //             onPressed: () {},
    //             icon: const Icon(IconlyBroken.add_user),
    //           ),
    //         ],
    //       ),
    //       floatingActionButtonLocation:
    //           FloatingActionButtonLocation.startDocked,
    //     );
    //   },
    // );
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset("assets/images/my-snf.jpeg"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "👋  hi, I am Sahibul",
                      style: AppTextStyle.title,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Software Developer",
                      style: AppTextStyle.small.copyWith(
                        color: Colors.grey,
                      ),
                    ),
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
      // desktop: (context) => AnimatedBuilder(
      //   // animation: _homeController,
      //   builder: (context, child) {
      //     return Scaffold(
      //       backgroundColor: ColorPalletes.bgDarkColor,
      //       // appBar:
      //       body: SingleChildScrollView(
      //         controller: _scrollController,
      //         child: SizedBox(
      //           height: MediaQuery.of(context).size.height,
      //           width: MediaQuery.of(context).size.width,
      //           child: ListView(
      //             children: [
      //               // AppBar
      //               MyAppBar(),

      //               // Header
      //               const HomeHeader(),

      //               SizedBox(
      //                 height: 500,
      //                 width: MediaQuery.of(context).size.width,
      //               ),

      //               // Footer
      //             ],
      //           ),
      //         ),
      //       ),
      //       floatingActionButton: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: const Icon(IconlyBroken.add_user),
      //           ),
      //           IconButton(
      //             onPressed: () {},
      //             icon: const Icon(IconlyBroken.add_user),
      //           ),
      //         ],
      //       ),
      //       floatingActionButtonLocation:
      //           FloatingActionButtonLocation.startDocked,
      //     );
      //   },
      // ),
      tablet: (context) => Container(),
    );
  }
}
