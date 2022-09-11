import 'package:flutter/material.dart';
import 'package:ryalize/models/model_api_response.dart';
import 'package:ryalize/services/dependency_service.dart';
import 'package:ryalize/services/storage_service.dart';
import 'package:ryalize/utils/base_model.dart';
import 'package:ryalize/utils/project_logger.dart';

class LoginVM extends BaseModel {
  final logger = getLogger("login_vm.dart");
  final GlobalKey<FormState> formKey;

  // final _userController = locator<UserController>();
  final _storageService = locator<StorageServices>();

  LoginVM(this.formKey);

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
      // var res = await _userController.doLogin(ModelRequestLogin(
      //     mobile: FunctionHelpers.parsePhoneNumber(phone), password: password));

      return ModelApiResult(
          status: EnumApiResult.failed, message: ' res.message');
    } catch (error) {
      logger.e('submitForm():::${error.toString()}');
      return ModelApiResult(
          status: EnumApiResult.failed, message: error.toString());
    } finally {
      isLoading = false;
    }
  }
}
