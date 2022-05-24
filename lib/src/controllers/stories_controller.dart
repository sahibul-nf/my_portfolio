import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../models/rss_fedd.dart';
import '../models/storie.dart';

const mediumRssFeed = "https://medium.com/feed/@sahibul_nf";
const devDotRssFeed = "https://dev.to/feed/sahibul_nf";
const hashnodeRssFeed = "https://sahibulnf.hashnode.dev/rss.xml";
const rss2JsonApiKey = "nsefnfsafaqpiwde3lggd8fitlzlyve0ozfhusja";

class StoriesController extends GetxController {
  var stories = <Storie>[];
  var isLoading = false.obs;

  Future<RssFeed?> fetchFeed(String feedUrl) async {
    // api for convert rss2Json
    final url =
        "https://api.rss2json.com/v1/api.json?rss_url=$feedUrl&api_key=$rss2JsonApiKey";

    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(url));

      final body = jsonDecode(response.body);

      RssFeed rssFeed = RssFeed.fromJson(body);

      return rssFeed;
    } catch (e) {
      log("Error: " + e.toString());
      return null;
    }
  }

  void loadStorie() {
    isLoading.value = true;
    // Medium Storie
    fetchFeed(mediumRssFeed).then((feed) {
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
    fetchFeed(devDotRssFeed).then((feed) {
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
    fetchFeed(mediumRssFeed).then((feed) {
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

  Future<void> launchStorie(String url) async {
    await launch(url);
    return;
  }

  @override
  void onInit() {
    loadStorie();
    super.onInit();
  }
}
