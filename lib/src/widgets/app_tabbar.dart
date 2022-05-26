import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sahibullab/src/views/about_view.dart';
import 'package:sahibullab/src/views/stories_view.dart';
import 'package:sahibullab/src/views/works_view.dart';
import 'package:sahibullab/src/widgets/app_card.dart';
import 'package:sahibullab/src/views/links_view.dart';
import 'package:sahibullab/src/widgets/work_card.dart';
import 'package:unicons/unicons.dart';

import '../settings/app_theme.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

List<TabPair> TabPairs = [
  TabPair(
    tab: const Tab(
      text: "Links 🔗",
    ),
    view: LinksView(),
  ),
  TabPair(
    tab: const Tab(
      text: "Works 🤯",
    ),
    view: WorksView(),
  ),
  TabPair(
    tab: const Tab(
      text: "Stories 📚",
    ),
    view: StoriesView(),
  ),
  TabPair(
    tab: const Tab(
      text: 'Certifications 📑',
    ),
    view: const Center(
      child: Text(
        'Coming soon!',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  TabPair(
    tab: const Tab(
      text: 'Me 👨🏻‍💻',
    ),
    view: AboutView(),
  ),
];

class TabBarAndTabViews extends StatefulWidget {
  const TabBarAndTabViews({Key? key}) : super(key: key);

  @override
  _TabBarAndTabViewsState createState() => _TabBarAndTabViewsState();
}

class _TabBarAndTabViewsState extends State<TabBarAndTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: TabPairs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // give the tab bar a height [can change height to preferred height]
        Container(
          height: 60,
          decoration: BoxDecoration(
            // color: Colors.white,
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            boxShadow: [AppShadow.card],
          ),
          margin: EdgeInsets.symmetric(
            horizontal: getValueForScreenType<double>(
              context: context,
              mobile: 20,
              tablet: 80,
              desktop: 60,
            ),
            vertical: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  boxShadow: [AppShadow.card],
                  color: Theme.of(context).primaryColor,
                ),
                labelStyle: AppTextStyle.title.copyWith(
                  fontSize: 16,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: TabPairs.map((tabPair) => tabPair.tab).toList()),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: TabPairs.map((tabPair) => tabPair.view).toList(),
          ),
        ),
      ],
    );
  }
}
