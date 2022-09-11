import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ryalize/screens/login/login_vm.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/utils/validators.dart';
import 'package:ryalize/widgets/project_form_input.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/widgets/project_text.dart';

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
            onSaved: (e) => model.phone = e!,
          ),
          ProjectFormInput(
            label: 'Password',
            placeholder: 'Enter Password',
            validator: (e) => Validators.validateText(e),
            onSaved: (e) => model.password = e!,
            password: true,
          ).paddingTop(kSpacingMedium),
          const ProjectText('Don\'t have an account? sign up here')
              .onTap(() => UiUtils.goto(kRouteSignup))
              .paddingTop(kSpacingMedium)
        ],
      ),
    );
  }
}
