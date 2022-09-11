import 'package:flutter/material.dart';
import 'package:ryalize/screens/get_started/get_started_screen.dart';
import 'package:ryalize/screens/login/login_screen.dart';
import 'package:ryalize/screens/settings/settings_screen.dart';
import 'package:ryalize/utils/constants.dart';

class ProjectRoutes {
  ProjectRoutes._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kRouteLogin:
        return MyCustomRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        );
      case kRouteGetStarted:
        return MyCustomRoute(
          builder: (_) => const GetStartedScreen(),
          settings: settings,
        );
      // case kRouteForgetPassword:
      //   return MyCustomRoute(
      //     builder: (_) => ForgetPasswordRequestScreen(),
      //     settings: settings,
      //   );
      case kRouteSettings:
        return MyCustomRoute(
          builder: (_) => const SettingsScreen(),
          settings: settings,
        );
      default:
        return MyCustomRoute(
          builder: (_) => const GetStartedScreen(),
          settings: settings,
        );
    }
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // if (settings.isInitialRoute) return child;
    return FadeTransition(opacity: animation, child: child);
  }
}
