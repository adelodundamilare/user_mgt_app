import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/screens/get_started/get_started_vm.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/widgets/project_container.dart';
import 'package:ryalize/widgets/project_text.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<GetStartedVM>(
        onInitState: (model) => model.redirectUser(),
        model: GetStartedVM(),
        builder: (context, model, child) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(kImagesBg), fit: BoxFit.cover)),
                ),
                Positioned.fill(
                  top: kHeightFull(context) * 0.4,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(kImagesBgDesign))),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: kWidthFull(context),
                        decoration: BoxDecoration(
                            color: kColorWhite.withOpacity(0.2),
                            borderRadius: kBorderRadius),
                        child:
                            const _OverlayContent().paddingAll(kSpacingMedium),
                      ),
                    ),
                  ).paddingAll(kSpacingMedium),
                ),
              ],
            ),
          );
        });
  }
}

class _OverlayContent extends StatelessWidget {
  const _OverlayContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProjectTextTitle(
          'Bola Ahmed ',
          textColor: kColorWhite,
        ),
        const ProjectTextTitle(
          'Tinubu ',
          textColor: kColorWhite,
        ),
        const ProjectTextTitle(
          'Mobilizer',
          textColor: kColorWhite,
        ),
        const _ButtonWidgets().paddingTop(kSpacingMedium)
      ],
    );
  }
}

class _ButtonWidgets extends StatelessWidget {
  const _ButtonWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _Button(text: 'Login')
            .onTap(() => UiUtils.goto(kRouteLogin))
            .expand(),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  const _Button({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectContainer(
      bgColor: kColorWhite,
      child: ProjectText(
        text,
        textColor: kColorPrimary,
        centerText: true,
      ).paddingAll(kSpacingMedium),
    );
  }
}
