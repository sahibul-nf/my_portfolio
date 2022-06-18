import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahibullab/src/helpers/helpers.dart';
import 'package:sahibullab/src/settings/app_theme.dart';

class TechStackDesktop extends StatelessWidget {
  const TechStackDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 140,
        horizontal: MediaQuery.of(context).size.width * 0.15,
      ),
      // height: 50,
      // width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        // borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          Text(
            'My Tech Stack',
            style: AppTextStyle.titleDesktop,
          ),
          Container(
            width: 70,
            height: 2,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 70),
          Wrap(
            spacing: 70,
            runSpacing: 70,
            children: [
              for (var item in Helpers.techStack)
                Column(
                  children: [
                    SvgPicture.network(
                      Helpers.getTechImage(item),
                      width: 70,
                      height: 70,
                      placeholderBuilder: (context) => Center(
                        child: SpinKitFadingCircle(
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      item,
                      style: AppTextStyle.smallDesktop,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
