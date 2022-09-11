import 'dart:async';

import 'package:ryalize/services/dependency_service.dart';
import 'package:ryalize/services/storage_service.dart';
import 'package:ryalize/utils/base_model.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/ui_utils.dart';

class GetStartedVM extends BaseModel {
  redirectUser() {
    if (locator<StorageServices>().getUser().data?.mobilizerID != null) {
      Timer(const Duration(seconds: 3), () {
        UiUtils.gotoDisableBack(kRouteHome);
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        UiUtils.gotoDisableBack(kRouteLogin);
      });
    }
  }
}
