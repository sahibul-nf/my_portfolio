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

  String getTechImage(String tech) {
    switch (tech.toLowerCase()) {
      case "flutter":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/flutter-colored.svg";
      case "dart":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/dart-colored.svg";
      case "firebase":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/firebase-colored.svg";
      case "vue":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/vuejs-colored.svg";
      case "go":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/go-colored.svg";
      case "java":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/java-colored.svg";
      default:
        return "assets/images/2.0x/flutter_logo.png";
    }
  }

  @override
  void onInit() {
    loadWorks();
    super.onInit();
  }
}
