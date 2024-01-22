import 'package:employee_management_app/app_theme.dart';
import 'package:employee_management_app/views/employee_list_screen/employee_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/bloc/employee_bloc/employee_bloc.dart';
import 'routes.dart';
import 'controllers/repository/database_service.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc(),
      child: MaterialApp(
        title: 'Employee Manager',
        home: const EmployeeListScreen(),
        onGenerateRoute: AppNavigator.onGenerateRoute,
        scaffoldMessengerKey: AppNavigator.scaffoldMessengerKey,
        navigatorKey: AppNavigator.navigatorKey,
        theme: ThemeData(primaryColor: AppTheme.blueDark),
      ),
    );
  }
}
