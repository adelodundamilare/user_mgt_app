import 'package:ryalize/services/dependency_service.dart';
import 'package:ryalize/services/storage_service.dart';
import 'package:ryalize/utils/base_model.dart';
import 'package:ryalize/utils/function_helpers.dart';
import 'package:ryalize/utils/project_logger.dart';

class HomeVM extends BaseModel {
  final _storageService = locator<StorageServices>();
  final logger = getLogger("profile_tab_vm.dart");

  String getName() {
    return FunctionHelpers.getName(_storageService.getUser());
  }

  String getFirstName() {
    return FunctionHelpers.stringTitleCase(
        _storageService.getUser().data?.firstName ?? 'no_first_name');
  }

  String getLastName() {
    return FunctionHelpers.stringTitleCase(
        _storageService.getUser().data?.lastName ?? 'no_last_name');
  }

  String getEmail() {
    return _storageService.getUser().data?.email ?? 'no_email';
  }

  String getPhone() {
    return _storageService.getUser().data?.mobile ?? 'no_mobile_number';
  }
}
