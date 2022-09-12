import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/extensions/ryalize_color_scheme.dart';
import 'package:ryalize/forms/form_login.dart';
import 'package:ryalize/layouts/layout_with_back.dart';
import 'package:ryalize/screens/login/login_vm.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/widgets/project_container.dart';
import 'package:ryalize/widgets/project_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginVM>(
        model: LoginVM(),
        builder: (context, model, child) {
          return LayoutWithBack(
            title: '',
            isFullHeight: true,
            isLoading: model.isLoading,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProjectTextTitle('Welcome'),
                const ProjectTextTitle('Back'),
                FormLogin().paddingSymmetric(vertical: kSpacingMedium),
                const _LoginInfo(),
              ],
            ).paddingAll(kSpacingMedium),
          );
        });
  }
}

class _LoginInfo extends StatelessWidget {
  const _LoginInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectContainer(
        bgColor: Theme.of(context).colorScheme.loginInfoContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProjectTextTitle(
              'Login Info',
              textSize: kFontSizeAverage,
            ),
            const ProjectText(
                    'To complete the signup flow, you might be asked to enter a code you received on the phone number you registered with, something which may never come unless you\'re using a local number')
                .paddingTop(kSpacingSmall),
            const ProjectText(
                    'If you do not want to go through that stress, you can access the app using the details below')
                .paddingTop(kSpacingSmall),
            const ProjectTextTitle(
              'u: 08099868604',
              textSize: kFontSizeAverage,
            ).paddingTop(kSpacingSmall),
            const ProjectTextTitle(
              'p: password',
              textSize: kFontSizeAverage,
            ),
          ],
        ).paddingAll(kSpacingSmall));
  }
}
