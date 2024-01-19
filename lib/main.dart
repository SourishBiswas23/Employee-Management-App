import 'package:employee_management_app/routes.dart';
import 'package:employee_management_app/views/employee_list_screen/employee_list_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Manager',
      home: const EmployeeListScreen(),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
      navigatorKey: AppNavigator.navigatorKey,
    );
  }
}
