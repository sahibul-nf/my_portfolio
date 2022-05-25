import 'dart:developer';

import 'package:get/get.dart';
import 'package:sahibullab/src/entities/work.dart';
import 'package:sahibullab/src/repositories/works_repository.dart';

class WorksController extends GetxController {
  var works = <Work>[].obs;
  var isLoading = false.obs;

  loadWorks() {
    isLoading.value = true;
    WorksRepository.fetchPinnedGithubRepo("sahibul-nf").then((repo) {
      if (repo != null) {
        for (var item in repo) {
          Work _work = Work();
          _work.title = item.repo;
          _work.link = item.link;
          _work.imageUrl = item.image;
          _work.forks = item.forks;
          _work.description = item.description;
          _work.owner = item.owner;
          _work.stars = item.stars;
          _work.techStack = item.language;
          _work.techColor = item.languageColor;
          _work.website = item.website;

          works.add(_work);
        }
      }

      log(works.length.toString());
    });

    isLoading.value = false;
  }

  @override
  void onInit() {
    loadWorks();
    super.onInit();
  }
}
