import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryalize/models/model_api_response.dart';
import 'package:ryalize/screens/login/login_vm.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/utils/validators.dart';
import 'package:ryalize/widgets/project_button.dart';
import 'package:ryalize/widgets/project_form_input.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/widgets/project_text.dart';
import 'package:ryalize/widgets/show_dialog_error.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginVM>(context);
    return Form(
      key: model.formKey,
      child: Column(
        children: [
          ProjectFormInput(
            label: 'Phone',
            placeholder: '+234',
            validator: (e) => Validators.validatePhoneNumber(e),
            keyboardType: EnumKeyboardType.number,
            prefixIcon: const Icon(
              EvaIcons.phoneCallOutline,
              color: kColorRed,
            ),
            onSaved: (e) => model.phone = e!,
          ),
          ProjectFormInput(
            label: 'Password',
            placeholder: 'Enter Password',
            validator: (e) => Validators.validateText(e),
            onSaved: (e) => model.password = e!,
            password: true,
            prefixIcon: const Icon(
              EvaIcons.lockOutline,
              color: kColorRed,
            ),
          ).paddingTop(kSpacingMedium),
          const ProjectText(
            'Don\'t have an account? tap to sign up',
            textColor: kColorPrimary,
          )
              .onTap(() => UiUtils.goto(kRouteCreateAccount))
              .paddingTop(kSpacingMedium)
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
        ],
      ),
    );
  }
}
