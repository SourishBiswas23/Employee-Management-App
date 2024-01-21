import 'package:employee_management_app/models/employee.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../app_theme.dart';
import '../../common/generate_key.dart';
import '../../controllers/bloc/employee_bloc/employee_bloc.dart';
import '../../routes.dart';
import 'dismissible_list_tile.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {

  @override
  void initState() {
    context.read<EmployeeBloc>().add(LoadEmployeesEvent());
    initializeDateFormatting();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {

        List<EmployeeModel> currentEmployees = state.allEmployees
            .where((employee) => employee.dateOfLeaving.isEmpty)
            .toList();
        List<EmployeeModel> previousEmployees = state.allEmployees
            .where((employee) => employee.dateOfLeaving.isNotEmpty)
            .toList();
        
        return Scaffold(
          backgroundColor: AppTheme.greyLight,
          appBar: AppBar(
            backgroundColor: AppTheme.blueDark,
            title: Text(
              'Employee List',
              style: AppTheme.headingLarge.copyWith(color: Colors.white),
            ),
          ),
          body: state.allEmployees.isEmpty
              ? Center(
                  child: Image.asset(
                    'assets/images/no_employee_records.png',
                    height: 245,
                    width: 260,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        color: AppTheme.greyLight,
                        child: Text(
                          'Current Employees',
                          style: AppTheme.headingMedium.copyWith(
                            color: AppTheme.blueDark,
                          ),
                        ),
                      ),
                      ...List.generate(
                        currentEmployees.length,
                        (index) => DismissibleListTile(
                          key: ValueKey<String>(
                            generateKey(employee: currentEmployees[index]),
                          ),
                          employee: currentEmployees[index],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        color: AppTheme.greyLight,
                        child: Text(
                          'Previous Employees',
                          style: AppTheme.headingMedium.copyWith(
                            color: AppTheme.blueDark,
                          ),
                        ),
                      ),
                      ...List.generate(
                        previousEmployees.length,
                        (index) => DismissibleListTile(
                          key: ValueKey<String>(
                            generateKey(employee: previousEmployees[index]),
                          ),
                          employee: previousEmployees[index],
                        ),
                      ),
                    ],
                  ),
                ),
          floatingActionButton: GestureDetector(
            onTap: () => AppNavigator.pushReplace(
              route: AppRoute.addEmployeeDetailsScreen,
            ),
            child: Container(
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
          ),
        );
      },
    );
  }
}

