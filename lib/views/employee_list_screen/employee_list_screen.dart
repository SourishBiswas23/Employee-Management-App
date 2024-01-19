import 'package:employee_management_app/app_theme.dart';
import 'package:flutter/material.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.greyLight,
      appBar: AppBar(
        backgroundColor: AppTheme.blueDark,
        title: Text(
          'Employee List',
          style: AppTheme.headingLarge.copyWith(color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/no_employee_records.png',
          height: 245,
          width: 260,
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: AppTheme.blueDark,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(16),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
