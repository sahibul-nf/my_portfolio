import 'package:url_launcher/url_launcher.dart';

class Helpers {
  static Future<void> launchURL(String url) async {
    await launch(url);
    return;
  }

  static List<String> techStack = [
    'flutter',
    'dart',
    'go',
    'java',
    'supabase',
    'firebase',
    'figma'
  ];

  static String getTechImage(String tech) {
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
      case "supabase":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/supabase-colored.svg";
      case "figma":
        return "https://raw.githubusercontent.com/danielcranney/readme-generator/main/public/icons/skills/figma-colored.svg";
      default:
        return "assets/images/2.0x/flutter_logo.png";
    }
  }
}
