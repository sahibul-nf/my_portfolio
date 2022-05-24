import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sahibullab/src/models/github_user.dart';

const profileUrl = "https://api.github.com/users/sahibul-nf";

class UserRepository {
  static Future<GithubUser?> getUser() async {
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(profileUrl));

      final body = jsonDecode(response.body);

      GithubUser githubUser = GithubUser.fromJson(body);

      return githubUser;
    } catch (e) {
      log("Error: " + e.toString());
      return null;
    }
  }
}
