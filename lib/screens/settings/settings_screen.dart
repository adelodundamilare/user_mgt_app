import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:ryalize/extensions/ryalize_color_scheme.dart';
import 'package:ryalize/forms/form_change_password.dart';
import 'package:ryalize/forms/form_edit_profile.dart';
import 'package:ryalize/layouts/layout_with_back.dart';
import 'package:ryalize/screens/settings/settings_vm.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/widgets/project_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWithBack(
        title: 'Settings',
        bgColor: Theme.of(context).colorScheme.lightGreyToDark,
        body: Column(
          children: [
            const _PageLinks(),
            const _FooterWidget().paddingTop(kSpacingLarge),
          ],
        ).paddingAll(kSpacingMedium));
  }
}

class _PageLinks extends StatelessWidget {
  const _PageLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsVM>(context);
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
            _SectionLinkModel(
                text: 'Enable Dark Mode',
                iconWidget: _DarkModeSwitch(
                  onChanged: (value) => model.isDarkMode = value,
                  value: model.isDarkMode,
                ),
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
    final model = Provider.of<SettingsVM>(context);

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
  const _SectionLinks({Key? key, required this.items, this.sectionTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectTextTitle(
          sectionTitle ?? '',
          textSize: kFontSizeBig,
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

                            /// show widget if iconWidget is not null
                            Icon(
                              EvaIcons.chevronRight,
                              color: Theme.of(context).colorScheme.faintGray,
                            ).visible(items[i].iconWidget == null),
                            items[i].iconWidget ?? Container()
                          ],
                        ).paddingSymmetric(vertical: kSpacingMedium),
                        Container(
                          color: Theme.of(context).colorScheme.faintGray,
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
  final Widget? iconWidget;
  final Function() onTap;
  _SectionLinkModel({required this.text, this.iconWidget, required this.onTap});
}

class _DarkModeSwitch extends StatelessWidget {
  final void Function(bool)? onChanged;
  final bool value;
  const _DarkModeSwitch(
      {Key? key, required this.onChanged, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: onChanged,
      value: value,
      activeColor: Theme.of(context).primaryColor,
      activeTrackColor: Theme.of(context).dividerColor,
      inactiveThumbColor: Theme.of(context).dividerColor,
      inactiveTrackColor: Theme.of(context).dividerColor,
    );
  }
}
