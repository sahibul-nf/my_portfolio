import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:sahibullab/src/models/pinned_github_repo.dart';

class WorksRepository {
  static Future<List<PinnedGithubRepo>?> fetchPinnedGithubRepo(
      String username) async {
    final pinnedRepoUrl =
        "https://gh-pinned-repos.egoist.sh/?username=$username";

    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(pinnedRepoUrl));

      final body = jsonDecode(response.body);

      return List<PinnedGithubRepo>.from(
          body.map((x) => PinnedGithubRepo.fromJson(x)));
    } catch (e) {
      log("Error: " + e.toString());
      return null;
    }
  }
}
