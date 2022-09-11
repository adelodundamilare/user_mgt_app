import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/widgets/project_button.dart';
import 'package:ryalize/widgets/project_container.dart';
import 'package:ryalize/widgets/project_text.dart';

class ShowDialogError extends StatelessWidget {
  final String message;
  const ShowDialogError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectContainer(
          bgColor: kColorRed,
          borderRadius: kBorderRadiusFull,
          child: const Icon(
            EvaIcons.infoOutline,
            color: kColorWhite,
          ).paddingAll(kSpacingMedium),
        ),
        const ProjectTextTitle(
          'Error',
          textSize: kFontSizeMedium,
        ).paddingTop(kSpacingMedium),
        ProjectText(
          message,
          centerText: true,
        ).paddingTop(kSpacingMedium),
        ProjectButton(
          onTap: () => UiUtils.goBack(),
          text: 'Close',
          withBg: true,
        ).paddingTop(kSpacingMedium)
      ],
    );
  }
}
