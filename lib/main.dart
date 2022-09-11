import 'package:flutter/material.dart';
import 'package:ryalize/screens/get_started/get_started_screen.dart';
import 'package:ryalize/services/dependency_service.dart';
import 'package:ryalize/utils/constants.dart';
import 'package:ryalize/utils/project_routes.dart';
import 'package:ryalize/utils/ui_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: kAppName,
        theme: kThemeData,
        themeMode: ThemeMode.light,
        darkTheme: kThemeDataDark,
        debugShowCheckedModeBanner: false,
        navigatorKey: UiUtils.navigatorKey(),
        home: const GetStartedScreen(),
        onGenerateRoute: (RouteSettings settings) =>
            ProjectRoutes.generateRoute(
              settings,
            ));
  }
}
