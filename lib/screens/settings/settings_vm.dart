import 'package:ryalize/services/dependency_service.dart';
import 'package:ryalize/services/storage_service.dart';
import 'package:ryalize/utils/base_model.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';

class SettingsVM extends BaseModel {
  final _storageService = locator<StorageServices>();

  logout() {
    _storageService.clear();
    UiUtils.gotoDisableBack(kRouteLogin);
  }
}
