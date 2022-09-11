import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:ryalize/forms/form_edit_profile.dart';
import 'package:ryalize/screens/home/home_vm.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/widgets/project_button.dart';
import 'package:ryalize/widgets/project_container.dart';
import 'package:ryalize/widgets/project_text.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeVM>(
        model: HomeVM(),
        builder: (context, model, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: kColorWhite,
              actions: <Widget>[
                const _SettingsWidget()
                    .onTap(() => UiUtils.goto(kRouteSettings))
                    .paddingAll(kSpacingSmall),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProjectTextTitle(model.getName()),
                  const _ProfileCard().paddingTop(kSpacingMedium),
                  const _UserInfo().paddingTop(kSpacingLarge + kSpacingLarge),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ).paddingAll(kSpacingMedium).paddingBottom(kSpacingLarge),
            ),
          );
        });
  }
}

class _SettingsWidget extends StatelessWidget {
  const _SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectContainer(
      bgColor: kColorPrimary,
      width: 40,
      // height: 50,
      borderRadius: kBorderRadiusSmall,
      child: const Icon(
        EvaIcons.settings,
        color: kColorWhite,
      ).center(),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeVM>(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ProjectContainer(
          bgColor: kColorPrimary,
          gradient: kGreenGradient,
          width: kWidthFull(context),
          height: 150,
          child: Stack(
            children: [
              Positioned(
                  right: -200,
                  bottom: 50,
                  child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                          color: kColorPrimaryDark.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(1000))))),
              ProjectContainer(
                bgColor: kColorAccent,
                child: const ProjectText(
                  'Update',
                  isBoldFont: true,
                  textColor: kColorWhite,
                ).paddingAll(kSpacingSmall),
              ).paddingAll(kSpacingMedium).onTap(() =>
                  UiUtils.showBottomSheetModal(
                      context: context, widget: FormEditProfile())),
            ],
          ),
        ),
      ],
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeVM>(context);
    return Column(
      children: [
        _ProfileInfo(
          text: model.getPhone(),
          icon: EvaIcons.phoneCallOutline,
        ),
        _ProfileInfo(
          text: model.getEmail(),
          icon: EvaIcons.emailOutline,
        ).paddingTop(kSpacingSmall),
        _ProfileInfo(
          text: model.getName(),
          icon: EvaIcons.personOutline,
        ).paddingTop(kSpacingSmall),
      ],
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  final String text;
  final IconData icon;
  const _ProfileInfo({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectContainer(
      bgColor: kColorGrey,
      child: Row(children: [
        Icon(
          icon,
          color: kColorPrimary,
        ),
        ProjectText(text).paddingLeft(kSpacingSmall)
      ]).paddingAll(kSpacingMedium),
    );
  }
}
