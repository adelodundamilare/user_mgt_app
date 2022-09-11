import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:ryalize/forms/form_change_password.dart';
import 'package:ryalize/forms/form_edit_profile.dart';
import 'package:ryalize/layouts/layout_with_back.dart';
import 'package:ryalize/screens/settings/settings_vm.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/widgets/project_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingsVM>(
        model: SettingsVM(),
        builder: (context, model, child) {
          return LayoutWithBack(
              title: 'Settings',
              bgColor: kColorGrey,
              body: Column(
                children: [
                  const _PageLinks(),
                  const _FooterWidget().paddingTop(kSpacingLarge),
                ],
              ).paddingAll(kSpacingMedium));
        });
  }
}

class _PageLinks extends StatelessWidget {
  const _PageLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionLinks(
          sectionTitle: 'Profile',
          items: [
            _SectionLinkModel(
                text: 'Edit Profile',
                onTap: () => UiUtils.showBottomSheetModal(
                    context: context, widget: FormEditProfile())),
            _SectionLinkModel(
                text: 'Change Password',
                onTap: () => UiUtils.showBottomSheetModal(
                    context: context, widget: FormChangePassword())),
          ],
        ),
      ],
    );
  }
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of(context);

    return Column(
      children: [
        const ProjectText(
          'Sign Out',
          textColor: kColorPrimary,
          textSize: kFontSizeMedium,
          isBoldFont: true,
          centerText: true,
        ).onTap(() => model.logout()),
        const ProjectText(
          'Version 1.0.0', //@todo: make dynamic
          centerText: true,
        ).paddingTop(kSpacingMedium),
      ],
    );
  }
}

class _SectionLinks extends StatelessWidget {
  final String? sectionTitle;
  final List<_SectionLinkModel> items;
  final bool isDesignTwo;
  const _SectionLinks(
      {Key? key,
      required this.items,
      this.isDesignTwo = false,
      this.sectionTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectTextTitle(
          sectionTitle ?? '',
          textSize: isDesignTwo ? kFontSizeBig : kFontSizeSmall,
        ).visible(sectionTitle != null),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: UiUtils.projectDynamicWidget(
                items: items,
                builder: (i) => Column(
                      children: [
                        Row(
                          children: [
                            ProjectText(
                              items[i].text,
                              textSize: kFontSizeMedium,
                            ).expand(),
                            const Icon(EvaIcons.chevronRight)
                                .visible(!items[i].actionDone),
                            const Icon(
                              EvaIcons.checkmarkCircle2,
                              color: kColorAccent,
                            ).visible(items[i].actionDone)
                          ],
                        ).paddingSymmetric(vertical: kSpacingMedium).onTap(
                            items[i].actionDone
                                ? () => print('')
                                : items[i].onTap),
                        Container(
                          color: kColorBlack.withOpacity(0.1),
                          height: 1,
                          width: kWidthFull(context),
                        ).visible(items.length - 1 != i)
                      ],
                    ))),
      ],
    );
  }
}

class _SectionLinkModel {
  final String text;
  final bool actionDone;
  final Function() onTap;
  _SectionLinkModel(
      {required this.text, this.actionDone = false, required this.onTap});
}
