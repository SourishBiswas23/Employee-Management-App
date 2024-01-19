import 'package:flutter/material.dart';

import 'routes.dart';
import 'views/add_employee_details_screen/add_employee_details_screen.dart';

void main(List<String> args) {
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
