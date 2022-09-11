import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/widgets/project_button.dart';
import 'package:ryalize/widgets/project_container.dart';
import 'package:ryalize/widgets/project_text.dart';

class ShowDialogSuccess extends StatelessWidget {
  final String message;
  final Function() onTapFunction;
  const ShowDialogSuccess(
      {Key? key, required this.message, required this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectContainer(
          bgColor: kColorPrimary,
          borderRadius: kBorderRadiusFull,
          child: const Icon(
            EvaIcons.emailOutline,
            color: kColorWhite,
          ).paddingAll(kSpacingMedium),
        ),
        const ProjectTextTitle(
          'Success',
          textSize: kFontSizeMedium,
        ).paddingTop(kSpacingMedium),
        ProjectText(
          message,
          centerText: true,
        ).paddingTop(kSpacingMedium),
        ProjectButton(
          onTap: onTapFunction,
          text: 'Continue',
          withBg: true,
        ).paddingTop(kSpacingMedium)
      ],
    );
  }
}
