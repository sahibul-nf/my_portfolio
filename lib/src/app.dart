import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sahibullab/src/views/about_view.dart';
import 'package:sahibullab/src/views/home_view.dart';
import 'package:sahibullab/src/views/links_view.dart';
import 'package:sahibullab/src/views/stories_view.dart';
import 'package:sahibullab/src/views/works_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      // restorationScopeId: 'app',
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName: (_) => HomeView(),
        LinksView.routeName: (_) => LinksView(),
        WorksView.routeName: (_) => WorksView(),
        StoriesView.routeName: (_) => StoriesView(),
        AboutView.routeName: (_) => AboutView(),
      },
    );
  }
}
