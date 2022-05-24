import 'dart:developer';

import 'package:get/get.dart';
import 'package:sahibullab/src/repositories/stories_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entities/storie.dart';

const mediumRssFeed = "https://medium.com/feed/@sahibul_nf";
const devDotRssFeed = "https://dev.to/feed/sahibul_nf";
const hashnodeRssFeed = "https://sahibulnf.hashnode.dev/rss.xml";

class StoriesController extends GetxController {
  var stories = <Storie>[];
  var isLoading = false.obs;

  void loadStorie() {
    isLoading.value = true;
    // Medium Storie
    StoriesRepository.fetchFeed(mediumRssFeed).then((feed) {
      if (feed != null) {
        for (var item in feed.items) {
          Storie _storie = Storie(logo: feed.feed.image);
          _storie.title = item.title;
          _storie.link = item.link;
          _storie.thumbnail = item.thumbnail;
          _storie.datePublished = item.pubDate;
          _storie.categories = item.categories;
          _storie.author = item.author;

          stories.add(_storie);
        }
      }

      log(stories.length.toString());
    });

    // Dev.to Storie
    StoriesRepository.fetchFeed(devDotRssFeed).then((feed) {
      if (feed != null) {
        for (var item in feed.items) {
          Storie _storie = Storie(logo: feed.feed.image);
          _storie.title = item.title;
          _storie.link = item.link;
          _storie.thumbnail = item.thumbnail;
          _storie.datePublished = item.pubDate;
          _storie.categories = item.categories;
          _storie.author = item.author;

          stories.add(_storie);
        }
      }

      log(stories.length.toString());
    });

    // Hashnode Blog Storie
    StoriesRepository.fetchFeed(mediumRssFeed).then((feed) {
      if (feed != null) {
        for (var item in feed.items) {
          Storie _storie = Storie(logo: feed.feed.image);
          _storie.title = item.title;
          _storie.link = item.link;
          _storie.thumbnail = item.thumbnail;
          _storie.datePublished = item.pubDate;
          _storie.categories = item.categories;
          _storie.author = item.author;

          stories.add(_storie);
        }
      }

      log(stories.length.toString());
    });

    isLoading.value = false;
  }

  @override
  void onInit() {
    loadStorie();
    super.onInit();
  }
}
