import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/models/model_api_response.dart';
import 'package:ryalize/services/dependency_service.dart';
import 'package:ryalize/services/storage_service.dart';
import 'package:ryalize/utils/base_model.dart';
import 'package:ryalize/utils/base_widget.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/project_logger.dart';
import 'package:ryalize/utils/ui_utils.dart';
import 'package:ryalize/utils/validators.dart';
import 'package:ryalize/widgets/project_button.dart';
import 'package:ryalize/widgets/project_form_input.dart';
import 'package:ryalize/widgets/project_text.dart';
import 'package:ryalize/widgets/show_dialog_error.dart';
import 'package:ryalize/widgets/show_dialog_success.dart';

class _VM extends BaseModel {
  final logger = getLogger("form_edit_profile.dart");
  final GlobalKey<FormState> formKey;

  // final _userController = locator<UserController>();
  final _storageService = locator<StorageServices>();

  _VM(this.formKey);

  // password
  String _password = "";
  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  Future<ModelApiResult> submitForm() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return ModelApiResult(status: EnumApiResult.unknown);
    }

    try {
      isLoading = true;
      // var _mobilizerID = _storageService.getProfile().data?.mobilizerID;
      // var res = await _userController.doEditProfile(ModelRequestEditProfile(
      //   mobilizerID: _mobilizerID,
      //   password: password,
      //   passwordChange: '1',
      // ));

      /// had to disable to update password feature cause
      /// I don't want the password changed on the main platform
      /// and do not want to go through constant stress of
      /// changing password.
      return ModelApiResult(
          status: EnumApiResult.failed,
          message: 'Update password feature is currently not supported');
    } catch (error) {
      logger.e('submitForm():::${error.toString()}');
      return ModelApiResult(
          status: EnumApiResult.failed, message: error.toString());
    } finally {
      isLoading = false;
    }
  }
}

class FormChangePassword extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<_VM>(
        model: _VM(_formKey),
        builder: (context, model, child) {
          return Form(
            key: model.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: kWidthFull(context),
                  child: const ProjectText(
                    'close',
                    textAlign: TextAlign.right,
                    textColor: kColorRed,
                  ).onTap(() => UiUtils.goBack()),
                ),
                const ProjectTextTitle('Change Password')
                    .paddingTop(kSpacingMedium),
                ProjectFormInput(
                  label: 'New Password',
                  placeholder: 'Input New Password',
                  validator: (e) => Validators.validateText(e),
                  password: true,
                  onSaved: (e) => model.password = e!,
                ).paddingTop(kSpacingMedium),
                ProjectFormInput(
                  label: 'Confirm Password',
                  placeholder: 'Enter Confirm Password',
                  password: true,
                  validator: (e) => Validators.validateConfirmPassword(
                      password: model.password, value: e),
                ).paddingTop(kSpacingMedium),
                ProjectButton(
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
                                          'Action Successful'));
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
                        text: 'Change Password',
                        isLoading: model.isLoading,
                        withBg: true)
                    .paddingTop(kSpacingMedium)
              ],
            ).paddingAll(kSpacingMedium),
          );
        });
  }
}
