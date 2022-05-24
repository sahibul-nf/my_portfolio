import 'package:flutter/material.dart';
import 'package:sahibullab/src/models/work.dart';
import 'package:sahibullab/src/widgets/work_card.dart';

class WorksView extends StatelessWidget {
  WorksView({Key? key}) : super(key: key);

  final List<Work> works = [
    Work(
      "hiQuran",
      "An quran app made with Flutter dajda dajd a dajd ajd ajd ajsd ",
      "Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim.",
      "assets/images/Group 1.png",
      [
        "assets/images/2.0x/flutter_logo.png",
        "assets/images/2.0x/figma_logo.png",
      ],
    ),
    Work(
      "Acehnese Dictionary",
      "An dictionary app made with Flutter",
      "Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim.",
      "assets/images/Group 1.png",
      [
        "assets/images/2.0x/flutter_logo.png",
        "assets/images/2.0x/figma_logo.png",
      ],
    ),
    Work(
      "Acehnese Dictionary",
      "An dictionary app made with Flutter",
      "Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim.",
      "assets/images/Group 1.png",
      [
        "assets/images/2.0x/flutter_logo.png",
        "assets/images/2.0x/figma_logo.png",
      ],
    ),
    Work(
      "Acehnese Dictionary",
      "An dictionary app made with Flutter",
      "Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim.",
      "assets/images/Group 1.png",
      [
        "assets/images/2.0x/flutter_logo.png",
        "assets/images/2.0x/figma_logo.png",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return WorkCard(
          thumbnail: works[index].imageUrl!,
          title: works[index].title!,
          shortDescription: works[index].shortDescription!,
          techStack: works[index].techStack,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: works.length,
    );
  }
}
