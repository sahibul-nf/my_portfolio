// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class MyAppBar extends StatelessWidget {
//   MyAppBar({Key? key}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       toolbarHeight: 80,
//       backgroundColor:
//           ColorPalletes.primaryColor.withOpacity(_homeController.opacity),
//       title: ConstrainedBox(
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width * 0.7,
//         ),
//         child: Row(
//           children: [
//             Flexible(
//               child: Container(
//                 height: 70,
//                 width: 140,
//                 padding: const EdgeInsets.all(10),
//                 child: Center(
//                   child: Stack(
//                     alignment: Alignment.centerLeft,
//                     children: [
//                       SvgPicture.asset(
//                         "assets/item2.svg",
//                         color: ColorPalletes.primaryColor,
//                       ),
//                       Text.rich(
//                         TextSpan(
//                           text: "Sahi",
//                           style:
//                               AppTextStyle.title.copyWith(color: Colors.white),
//                           children: [
//                             TextSpan(
//                               text: "bul",
//                               style: AppTextStyle.title.copyWith(
//                                 color: ColorPalletes.bgLightColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const Spacer(),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "About",
//                 style: AppTextStyle.title.copyWith(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Showcase",
//                 style: AppTextStyle.title.copyWith(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Blog",
//                 style: AppTextStyle.title.copyWith(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             ElevatedButton(
//               onPressed: () {
//               },
//               child: Text(
//                 "Contact",
//                 style: AppTextStyle.normal.copyWith(
//                   color: ColorPalletes.bgLightColor,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       elevation: 0,
//     );
//   }
// }
