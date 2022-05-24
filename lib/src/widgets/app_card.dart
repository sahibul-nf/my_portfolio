import 'package:flutter/material.dart';

import '../settings/app_theme.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    Key? key,
    required this.child,
    this.vPadding = 16,
    this.hPadding = 20,
    this.hMargin = 20,
    this.radius = 25,
    this.color,
    this.vMargin = 0,
  }) : super(key: key);
  final Widget child;
  final double vPadding;
  final double hPadding;
  final double hMargin;
  final double vMargin;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
      decoration: BoxDecoration(
        color: (color == null) ? Theme.of(context).primaryColor : color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [AppShadow.card],
      ),
      child: child,
    );
  }
}
