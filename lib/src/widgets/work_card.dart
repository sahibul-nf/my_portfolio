import 'package:flutter/material.dart';
import 'package:sahibullab/src/settings/app_theme.dart';
import 'package:sahibullab/src/widgets/app_card.dart';

class WorkCard extends StatelessWidget {
  const WorkCard(
      {Key? key,
      required this.thumbnail,
      required this.title,
      required this.shortDescription,
      required this.techStack})
      : super(key: key);
  final String thumbnail;
  final String title;
  final String shortDescription;
  final List<String> techStack;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      hPadding: 8,
      vPadding: 8,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                thumbnail,
                height: 280,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.6,
                  0.7,
                  0.8,
                ],
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Container(
            height: 280,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.bigTitle.copyWith(
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        shortDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.small.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (var item in techStack)
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Image.asset(
                            item,
                            width: 18,
                            height: 18,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
