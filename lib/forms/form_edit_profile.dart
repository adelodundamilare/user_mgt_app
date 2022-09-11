import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/models/model_api_response.dart';
import 'package:ryalize/models/model_user.dart';
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
  // email
  String _email = "";
  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  // firstName
  String _firstName = "";
  String get firstName => _firstName;
  set firstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  // lastName
  String _lastName = "";
  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  ModelUser userData() {
    return _storageService.getUser();
  }

  Future<ModelApiResult> submitForm() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return ModelApiResult(status: EnumApiResult.unknown);
    }

    try {
      isLoading = true;

      return ModelApiResult(
          status: EnumApiResult.failed, message: 'res.message');
    } catch (error) {
      logger.e('submitForm():::${error.toString()}');
      return ModelApiResult(
          status: EnumApiResult.failed, message: error.toString());
    } finally {
      isLoading = false;
    }
  }
}

class FormEditProfile extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormEditProfile({Key? key}) : super(key: key);

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
                const ProjectTextTitle('Update Profile')
                    .paddingBottom(kSpacingMedium),
                ProjectFormInput(
                  label: 'Email',
                  placeholder: 'Input Email Address',
                  initialValue: model.userData().data?.email ?? '',
                  validator: (e) => Validators.validateEmail(e),
                  onSaved: (e) => model.email = e!,
                ).paddingTop(kSpacingMedium),
                ProjectFormInput(
                  label: 'First name',
                  placeholder: 'Enter First name',
                  initialValue: model.userData().data?.firstName ?? '',
                  validator: (e) => Validators.validateText(e),
                  onSaved: (e) => model.firstName = e!,
                ).paddingTop(kSpacingMedium),
                ProjectFormInput(
                  label: 'Last name',
                  placeholder: 'Enter Last name',
                  initialValue: model.userData().data?.lastName ?? '',
                  validator: (e) => Validators.validateText(e),
                  onSaved: (e) => model.lastName = e!,
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
                                          UiUtils.goto(kRouteHome),
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
                        text: 'Update Profile',
                        isLoading: model.isLoading,
                        withBg: true)
                    .paddingTop(kSpacingMedium)
              ],
            ).paddingAll(kSpacingMedium),
          );
        });
  }
}
