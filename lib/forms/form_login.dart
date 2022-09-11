import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ryalize/models/model_api_response.dart';
import 'package:ryalize/models/model_request.dart';
import 'package:ryalize/services/dependency_service.dart';
import 'package:ryalize/services/user_service.dart';
import 'package:ryalize/utils/base_model.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/function_helpers.dart';
import 'package:ryalize/utils/project_logger.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/utils/validators.dart';
import 'package:ryalize/widgets/project_button.dart';
import 'package:ryalize/widgets/project_container.dart';
import 'package:ryalize/widgets/project_form_input.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/widgets/project_text.dart';
import 'package:ryalize/widgets/show_dialog_error.dart';

class _VM extends BaseModel {
  final logger = getLogger("form_login.dart");
  final GlobalKey<FormState> formKey;

  final _userService = locator<UserService>();

  _VM(this.formKey);

  // password
  String _password = "";
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  // phone
  String _phone = "";
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  Future<ModelApiResult> submitForm() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return ModelApiResult(status: EnumApiResult.unknown);
    }

    try {
      isLoading = true;
      var res = await _userService.doLogin(ModelRequestLogin(
          mobile: FunctionHelpers.formatPhoneNumber(phone),
          password: password));

      /// save user profile to shared preference
      await FunctionHelpers.fetchAndSaveProfile(id: res.data?.voterID ?? '0');

      return ModelApiResult(
          status: EnumApiResult.success, message: res.message);
    } catch (error) {
      logger.e('submitForm():::${error.toString()}');
      return ModelApiResult(
          status: EnumApiResult.failed, message: error.toString());
    } finally {
      isLoading = false;
    }
  }
}

class FormLogin extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<_VM>(
        model: _VM(_formKey),
        builder: (context, model, child) {
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
                    .paddingTop(kSpacingMedium),
                ProjectButton(
                        isLoading: model.isLoading,
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
                        withBg: true)
                    .paddingTop(kSpacingMedium),
              ],
            ),
          );
        });
  }
}
