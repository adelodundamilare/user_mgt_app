import 'package:flutter/material.dart';
import 'package:ryalize/utils/constants.dart';

class ProjectContainer extends StatelessWidget {
  final BorderRadius? borderRadius;
  final Widget child;
  final Color? bgColor;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final BoxBorder? border;
  const ProjectContainer(
      {Key? key,
      required this.child,
      this.border,
      this.width,
      this.gradient,
      this.height,
      this.bgColor,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: border,
          gradient: gradient,
          borderRadius: borderRadius ?? kBorderRadius,
          color: bgColor),
      child: child,
    );
  }
}
