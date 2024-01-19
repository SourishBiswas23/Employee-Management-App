import 'package:flutter/material.dart';

import 'views/add_employee_details_screen/add_employee_details_screen.dart';
import 'views/edit_employee_list_screen/edit_employee_list_screen.dart';
import 'views/employee_list_screen/employee_list_screen.dart';
import 'views/not_found_screen/not_found_screen.dart';

enum AppRoute {
  notFoundScreen,
  addEmployeeDetailsScreen,
  employeeListScreen,
  editEmployeeListScreen,
}

class _Paths {
  static const String notFoundScreen = '/notFoundScreen';
  static const String addEmployeeDetailsScreen = '/addEmployeeDetailsScreen';
  static const String employeeListScreen = '/employeeListScreen';
  static const String editEmployeeListScreen = '/editEmployeeListScreen';

  static const Map<AppRoute, String> _pathMap = {
    AppRoute.notFoundScreen: _Paths.notFoundScreen,
    AppRoute.addEmployeeDetailsScreen: _Paths.addEmployeeDetailsScreen,
    AppRoute.employeeListScreen: _Paths.employeeListScreen,
    AppRoute.editEmployeeListScreen: _Paths.editEmployeeListScreen,
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
      case _Paths.editEmployeeListScreen:
        return MaterialPageRoute(
          builder: (context) => const EditEmployeeListScreen(),
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
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(_Paths.of(route));
  }

  static void pop() {
    return navigatorKey.currentState?.pop();
  }
}
