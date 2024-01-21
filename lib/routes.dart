import 'package:flutter/material.dart';

import 'views/add_employee_details_screen/add_employee_details_screen.dart';
import 'views/edit_employee_details_screen/edit_employee_details_screen.dart';
import 'views/employee_list_screen/employee_list_screen.dart';
import 'views/not_found_screen/not_found_screen.dart';

enum AppRoute {
  notFoundScreen,
  addEmployeeDetailsScreen,
  employeeListScreen,
  editEmployeeDetailsScreen,
}

class _Paths {
  static const String notFoundScreen = '/notFoundScreen';
  static const String addEmployeeDetailsScreen = '/addEmployeeDetailsScreen';
  static const String employeeListScreen = '/employeeListScreen';
  static const String editEmployeeDetailsScreen = '/editEmployeeDetailsScreen';

  static const Map<AppRoute, String> _pathMap = {
    AppRoute.notFoundScreen: _Paths.notFoundScreen,
    AppRoute.addEmployeeDetailsScreen: _Paths.addEmployeeDetailsScreen,
    AppRoute.employeeListScreen: _Paths.employeeListScreen,
    AppRoute.editEmployeeDetailsScreen: _Paths.editEmployeeDetailsScreen,
  };

  static String of(AppRoute appRoute) => _pathMap[appRoute] ?? notFoundScreen;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.notFoundScreen:
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
      case _Paths.addEmployeeDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const AddEmployeeDetailsScreen(),
        );
      case _Paths.employeeListScreen:
        return MaterialPageRoute(
          builder: (context) => const EmployeeListScreen(),
        );
      case _Paths.editEmployeeDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => EditEmployeeDetailsScreen(
            employee: (settings.arguments as Map<String, dynamic>)['employee'],
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
    }
  }

  static Future? push({required AppRoute route}) {
    return navigatorKey.currentState?.pushNamed(_Paths.of(route));
  }

  static Future? pushReplace({
    required AppRoute route,
    Map<String, dynamic>? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      _Paths.of(route),
      arguments: arguments,
    );
  }

  static void pop() {
    return navigatorKey.currentState?.pop();
  }
}
