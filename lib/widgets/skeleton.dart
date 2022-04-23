import 'package:flutter/material.dart';
import 'package:recipe_app_practice/utils/colors.dart';

class Skeleton extends StatelessWidget {
  const Skeleton(
      {Key? key, this.height, this.width, this.isRounded = true, this.radius})
      : super(key: key);
  final double? height, width, radius;
  final bool isRounded;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius != null
              ? radius!
              : isRounded
                  ? 20
                  : 0,
        ),
        color: kSkelenton,
      ),
      padding: const EdgeInsets.all(5),
    );
  }
}
