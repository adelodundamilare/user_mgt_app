import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
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
import 'package:ryalize/widgets/project_form_input.dart';
import 'package:ryalize/widgets/show_dialog_error.dart';
import 'package:ryalize/widgets/show_dialog_success.dart';

class _VM extends BaseModel {
  final logger = getLogger("form_register.dart");
  final GlobalKey<FormState> formKey;
  final _userService = locator<UserService>();

  _VM(this.formKey);

  // phone
  String _phone = "";
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  // password
  String _password = "";
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  Future<String> _getNetworkInfo() async {
    var _res = '';
    for (var interface in await NetworkInterface.list()) {
      _res = interface.addresses.first.address;
    }
    return _res;
  }

  Future<ModelApiResult> submitForm() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return ModelApiResult(status: EnumApiResult.unknown);
    }

    try {
      isLoading = true;
      var ipAddress = await _getNetworkInfo();

      /// fetching user device mac address is currently
      /// unavailable for android and ios devices
      var macAddress = '02:00:00:00:00:00';
      var res = await _userService.doRegister(RegisterUserRequestModel(
          voterip: ipAddress,
          macAddress: macAddress,
          mobile: FunctionHelpers.formatPhoneNumber(phone),
          password: password));
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

class FormCreateAccount extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormCreateAccount({Key? key}) : super(key: key);

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
                  onSaved: (e) => model.phone = e!,
                  prefixIcon: const Icon(
                    EvaIcons.phoneCallOutline,
                    color: kColorRed,
                  ),
                ).paddingTop(kSpacingMedium),
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
                ProjectFormInput(
                  label: 'Confirm Password',
                  placeholder: 'Re-enter Password',
                  validator: (e) => Validators.validateConfirmPassword(
                      password: model.password, value: e),
                  password: true,
                  prefixIcon: const Icon(
                    EvaIcons.lockOutline,
                    color: kColorRed,
                  ),
                ).paddingTop(kSpacingMedium),
                ProjectButton(
                        isLoading: model.isLoading,
                        onTap: () async {
                          var result = await model.submitForm();
                          switch (result.status) {
                            case EnumApiResult.success:
                              UiUtils.showDialog(
                                  title: '',
                                  widget: ShowDialogSuccess(
                                      onTapFunction: () =>
                                          UiUtils.goto(kRouteLogin),
                                      message: result.message ??
                                          'We have sent an OTP code to the phone number you registered with.'));
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
                        text: 'Submit',
                        withBg: true)
                    .paddingTop(kSpacingMedium),
              ],
            ),
          );
        });
  }
}
