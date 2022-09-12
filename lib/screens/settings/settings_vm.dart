import 'package:ryalize/services/dependency_service.dart';
import 'package:ryalize/services/storage_service.dart';
import 'package:ryalize/utils/base_model.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';

class SettingsVM extends BaseModel {
  final _storageService = locator<StorageServices>();

  SettingsVM() {
    /// on page init, get isDarkMode value from storage
    isDarkMode = _storageService.isDarkMode();
  }

  logout() {
    _storageService.clear();
    UiUtils.gotoDisableBack(kRouteLogin);
  }

  // isDarkMode
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    _storageService.setIsDarkMode(value);
    notifyListeners();
  }
}
