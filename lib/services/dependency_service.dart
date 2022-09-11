import 'package:get_it/get_it.dart';
import 'package:ryalize/services/http_service.dart';
import 'package:ryalize/services/storage_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupDependencyService() async {
  locator.registerLazySingleton<HttpServices>(() => HttpServicesImpl());
  // locator.registerLazySingleton<UserController>(() => UserControllerImpl());

  await _setupStorageService();
}

Future<void> _setupStorageService() async {
  final instance = await StorageServicesImpl.getInstance();
  locator.registerLazySingleton<StorageServices>(() => instance!);
}
