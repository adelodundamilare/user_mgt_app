import 'package:ryalize/models/model_generic.dart';
import 'package:ryalize/models/model_login.dart';
import 'package:ryalize/models/model_register_user.dart';
import 'package:ryalize/models/model_request.dart';
import 'package:ryalize/models/model_user.dart';
import 'package:ryalize/services/http_service.dart';
import 'package:ryalize/utils/constants.dart';

import 'dependency_service.dart';

abstract class UserService {
  Future<ModelRegisterUser> doRegister(RegisterUserRequestModel data);
  Future<ModelLogin> doLogin(ModelRequestLogin data);
  Future<ModelRegisterUser> doRequestPasswordReset(RequestPasswordReset data);
  Future<ModelRegisterUser> doCreatePassword(ModelRequestCreatePassword data);
  Future<ModelUser> doFetchProfile(ModelRequestProfile data);
  Future<ModelGeneric> doEditProfile(ModelRequestEditProfile data);
}

class UserServiceImpl implements UserService {
  final _httpServices = locator<HttpServices>();

  @override
  Future<ModelRegisterUser> doRegister(RegisterUserRequestModel data) async {
    var res =
        await _httpServices.postHttp(kEndpointRegister, data: data.toJson());
    return ModelRegisterUser.fromJson(res);
  }

  @override
  Future<ModelLogin> doLogin(ModelRequestLogin data) async {
    var res = await _httpServices.postHttp(kEndpointLogin, data: data.toJson());
    return ModelLogin.fromJson(res);
  }

  @override
  Future<ModelRegisterUser> doRequestPasswordReset(
      RequestPasswordReset data) async {
    var res = await _httpServices.postHttp(kEndpointRequestPasswordReset,
        data: data.toJson());
    return ModelRegisterUser.fromJson(res);
  }

  @override
  Future<ModelRegisterUser> doCreatePassword(
      ModelRequestCreatePassword data) async {
    var res = await _httpServices.postHttp(kEndpointCreatePassword,
        data: data.toJson());
    return ModelRegisterUser.fromJson(res);
  }

  @override
  Future<ModelUser> doFetchProfile(ModelRequestProfile data) async {
    var res = await _httpServices.postHttp(kEndpointFetchProfile,
        data: data.toJson());
    return ModelUser.fromJson(res);
  }

  @override
  Future<ModelGeneric> doEditProfile(ModelRequestEditProfile data) async {
    var res = await _httpServices.postHttp(kEndpointUpdateProfile,
        data: data.toJson());
    return ModelGeneric.fromJson(res);
  }
}
