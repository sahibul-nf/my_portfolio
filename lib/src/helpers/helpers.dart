import 'package:url_launcher/url_launcher.dart';

class Helpers {
  static Future<void> launchURL(String url) async {
    await launch(url);
    return;
  }

  static List<String> techStack = [
    'Flutter',
    'Dart',
    'Go',
    'Vue Js',
    'Nuxt Js',
    'Java',
    'Supabase',
    'Firebase',
    'Mysql',
    'Postgresql',
    'Heroku',
    'Figma',
    'Xd',
  ];

  static String getTechImage(String tech) {
    switch (tech.toLowerCase()) {
      case "flutter":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/flutter-colored.svg";
      case "dart":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/dart-colored.svg";
      case "firebase":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/firebase-colored.svg";
      case "vue js":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/vuejs-colored.svg";
      case "go":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/go-colored.svg";
      case "java":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/java-colored.svg";
      case "supabase":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/supabase-colored.svg";
      case "figma":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/figma-colored.svg";
      case "heroku":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/heroku-colored.svg";
      case "xd":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/xd-colored.svg";
      case "nuxt js":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/nuxtjs-colored.svg";
      case "mysql":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/mysql-colored.svg";
      case "postgresql":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/postgresql-colored.svg";
      case "vue":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/vuejs-colored.svg";
      default:
        return "assets/images/2.0x/flutter_logo.png";
    }
  }

  static String? getCoverImage(String projectName) {
    switch (projectName.toLowerCase()) {
      case 'quran app':
        return 'assets/images/cover/quran-app.png';
      case 'aceh dictionary api':
        return 'assets/images/cover/acehnese-dictionary-cover.jpg';
      case 'moyu app':
        return 'assets/images/cover/moyu.jpeg';
      default:
        return null;
    }
  }
}
