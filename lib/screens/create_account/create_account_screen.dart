import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/forms/form_register.dart';
import 'package:ryalize/layouts/layout_with_back.dart';
import 'package:ryalize/screens/create_account/create_account_vm.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/widgets/project_text.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CreateAccountVM>(
        model: CreateAccountVM(),
        builder: (context, model, child) {
          return LayoutWithBack(
            title: '',
            isFullHeight: true,
            isLoading: model.isLoading,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const ProjectTextTitle('Create Account'),
                  FormCreateAccount().paddingSymmetric(vertical: kSpacingMedium)
                ]).expand(),
                const ProjectText(
                  'Login if you already have an account',
                  centerText: true,
                  textColor: kColorPrimary,
                )
                    .onTap(() => UiUtils.goto(kRouteLogin))
                    .paddingTop(kSpacingMedium)
                    .paddingBottom(kSpacingLarge)
                    .center(),
              ],
            ).paddingAll(kSpacingMedium),
          );
        });
  }
}
