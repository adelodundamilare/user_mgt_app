import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ryalize/models/model_user.dart';

abstract class StorageServices {
  // user
  setUser(ModelUser data);
  ModelUser getUser();
  // dark mode
  setIsDarkMode(bool value);
  bool isDarkMode();
  // clear
  clear();
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

  @override
  clear() {
    return _preferences!.remove('user_profile');
  }

  @override
  bool isDarkMode() {
    return _preferences!.getBool('user_dark_mode') ?? false;
  }

  @override
  setIsDarkMode(bool value) {
    return _preferences!.setBool('user_dark_mode', value);
  }
}
