import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:ryalize/forms/form_login.dart';
import 'package:ryalize/layouts/layout_with_back.dart';
import 'package:ryalize/models/model_api_response.dart';
import 'package:ryalize/screens/login/login_vm.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/utils/validators.dart';
import 'package:ryalize/widgets/project_button.dart';
import 'package:ryalize/widgets/project_form_input.dart';
import 'package:ryalize/widgets/project_text.dart';
import 'package:ryalize/widgets/show_dialog_error.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginVM>(
        model: LoginVM(_formKey),
        builder: (context, model, child) {
          return LayoutWithBack(
            title: '',
            isFullHeight: true,
            showBgDesign: true,
            isLoading: model.isLoading,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProjectTextTitle('Welcome'),
                const ProjectTextTitle('Back'),
                const FormLogin()
                    .paddingSymmetric(vertical: kSpacingMedium)
                    .expand(),
                ProjectButton(
                    onTap: () async {
                      var result = await model.submitForm();
                      switch (result.status) {
                        case EnumApiResult.success:
                          UiUtils.goto(kRouteHome);
                          break;
                        case EnumApiResult.failed:
                          UiUtils.showDialog(
                              title: '',
                              widget: ShowDialogError(
                                  message: result.message ??
                                      'Unable to complete action, please try again'));
                          break;
                        default:
                      }
                    },
                    text: 'Login',
                    withBg: true),
                const ProjectText(
                  'Register if you don\'t have an account',
                  centerText: true,
                )
                    .onTap(() => UiUtils.goto(kRouteSignup))
                    .paddingTop(kSpacingMedium)
                    .paddingBottom(kSpacingLarge)
                    .center()
              ],
            ).paddingAll(kSpacingMedium),
          );
        });
  }
}
