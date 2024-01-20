import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../app_theme.dart';
import '../../common/format_date_string.dart';
import '../../controllers/bloc/employee_bloc/employee_bloc.dart';
import '../../routes.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  late List<int> employeeKeys;

  @override
  void initState() {
    context.read<EmployeeBloc>().add(LoadEmployeesEvent());
    employeeKeys = List<int>.generate(
      context.read<EmployeeBloc>().state.allEmployees.length,
      (index) => index,
    );
    initializeDateFormatting();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeBloc, EmployeeState>(
      builder: (context, state) {
        employeeKeys = List<int>.generate(
          context.read<EmployeeBloc>().state.allEmployees.length,
          (index) => index,
        );
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
              : ListView.builder(
                  itemCount: state.allEmployees.length,
                  itemBuilder: (context, index) {
                    final String name = state.allEmployees[index].name;
                    final String position = state.allEmployees[index].position;
                    final String joiningDate = formatDateString(
                      dateString: state.allEmployees[index].dateOfJoining,
                    );
                    final String leavingDate = formatDateString(
                      dateString: state.allEmployees[index].dateOfLeaving,
                    );

                    return Dismissible(
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 40,
                        ),
                        color: AppTheme.red,
                        child: SvgPicture.asset(
                          'assets/images/delete_icon.svg',
                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      key: ValueKey<int>(employeeKeys[index]),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: AppTheme.greyLight,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: AppTheme.headingMedium.copyWith(
                                color: AppTheme.lightBlack,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              position,
                              style: AppTheme.bodyMedium.copyWith(
                                color: AppTheme.greyDark,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '$joiningDate ${leavingDate.isEmpty ? '' : ' - $leavingDate'}',
                            )
                          ],
                        ),
                      ),
                    );
                  },
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

