import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/forms/form_login.dart';
import 'package:ryalize/layouts/layout_with_back.dart';
import 'package:ryalize/screens/login/login_vm.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
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
              ],
            ).paddingAll(kSpacingMedium),
          );
        });
  }
}
