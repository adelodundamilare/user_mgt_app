import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ryalize/features/user/models/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageServices {
  setUser(ModelUser data);
  ModelUser getUser();
}

class StorageServicesImpl implements StorageServices {
  static StorageServicesImpl? _instance;
  static SharedPreferences? _preferences;

  static Future<StorageServicesImpl?> getInstance() async {
    _instance ??= StorageServicesImpl();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  @override
  ModelUser getUser() {
    try {
      if (kDebugMode) {
        print('>>>>>>>>>>>> getting logged in profile');
      }
      dynamic _data = jsonDecode(_preferences!.getString('user_profile') ?? '');
      return ModelUser.fromJson(_data);
    } catch (error) {
      if (kDebugMode) {
        print('>>>>>>>>>>>> $error');
      }
      return ModelUser();
    }
  }

  @override
  setUser(ModelUser items) {
    if (kDebugMode) {
      print('>>>>>>>>>>>> saving logged in user');
    }
    dynamic _encoded = jsonEncode(items.toJson());
    return _preferences!.setString('user_profile', _encoded);
  }
}