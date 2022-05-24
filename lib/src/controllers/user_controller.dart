import 'package:get/get.dart';
import 'package:sahibullab/src/entities/user.dart';
import 'package:sahibullab/src/repositories/user_repository.dart';

class UserController extends GetxController {
  Rx<User> user = User().obs;
  var isLoading = false.obs;

  void loadUser() async {
    isLoading.value = true;
    final githubUser = await UserRepository.getUser();

    if (githubUser != null) {
      User _user = User();
      _user.name = githubUser.name;
      _user.avatarUrl = githubUser.avatarUrl;
      _user.about = githubUser.bio;
      _user.location = githubUser.location;
      _user.email = githubUser.email;
      _user.website = githubUser.blog;
      _user.github = githubUser.htmlUrl;
      _user.repoCount = githubUser.publicRepos.toString();
      _user.followers = githubUser.followers.toString();
      _user.following = githubUser.following.toString();

      user.value = _user;
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }
}
