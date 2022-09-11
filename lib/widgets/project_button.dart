import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/widgets/project_text.dart';

class ProjectButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Widget? icon;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool withBg, isLoading;
  final Color? color;
  final bool withBorder;
  final BorderRadiusGeometry? borderRadius;
  const ProjectButton(
      {Key? key,
      required this.onTap,
      this.icon,
      required this.text,
      this.width,
      this.isLoading = false,
      this.borderRadius,
      this.withBorder = false,
      this.color,
      this.padding,
      this.withBg = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () => print('is loading...') : onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(kSpacingMedium),
        decoration: BoxDecoration(
            color: withBg
                ? color is Color
                    ? color
                    : isLoading
                        ? kColorPrimary.withOpacity(0.3)
                        : kColorPrimary
                : Colors.transparent,
            border: Border.all(
                color: withBorder ? kColorPrimary : Colors.transparent,
                width: 2),
            borderRadius: borderRadius ?? kBorderRadius),
        width: width ?? kWidthFull(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: icon ?? Container(),
            ),
            ProjectTextTitle(
              text,
              centerText: true,
              textColor: withBg
                  ? kColorWhite
                  : color is Color
                      ? color
                      : kColorPrimary,
              textSize: kFontSizeMedium,
            ),
            SizedBox(
              width: 30,
              height: 20,
              child: const CircularProgressIndicator(
                color: kColorWhite,
              ).paddingLeft(kSpacingSmall),
            ).visible(isLoading),
          ],
        ),
      ),
    );
  }
}

class ProjectButtonExtended extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? rightWidget;
  const ProjectButtonExtended(
      {Key? key, required this.title, required this.onTap, this.rightWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidthFull(context),
      padding: const EdgeInsets.symmetric(
          vertical: kSpacingMedium, horizontal: kSpacingMedium),
      decoration: const BoxDecoration(
          borderRadius: kBorderRadius, color: kColorPrimary),
      child: Row(
        children: [
          Expanded(
            child: ProjectTextTitle(
              title,
              textColor: kColorWhite,
            ),
          ),
          rightWidget ?? Container(),
          const Icon(EvaIcons.chevronRight, color: kColorWhite),
        ],
      ),
    ).onTap(onTap);
  }
}
