import 'package:flutter/material.dart';

import 'routes.dart';
import 'controllers/repository/database_service.dart';
import 'views/add_employee_details_screen/add_employee_details_screen.dart';

void main(List<String> args) async {
  await DatabaseService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Manager',
      home: const AddEmployeeDetailsScreen(),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}
