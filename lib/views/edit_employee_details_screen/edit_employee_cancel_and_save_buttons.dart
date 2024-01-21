import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme.dart';
import '../../controllers/bloc/employee_bloc/employee_bloc.dart';
import '../../models/employee.model.dart';
import '../../routes.dart';

class EditEmployeeCancelAndSaveButtons extends StatelessWidget {
  const EditEmployeeCancelAndSaveButtons({
    super.key,
    required this.employeeNameController,
    required this.selectedRoleController,
    required this.startDateController,
    required this.endDateController,
    required this.oldEmployee,
  });
  final TextEditingController employeeNameController;
  final TextEditingController selectedRoleController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final EmployeeModel oldEmployee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppTheme.blueLight,
              borderRadius: BorderRadius.circular(6),
            ),
            child: GestureDetector(
              onTap: () {
                AppNavigator.pushReplace(route: AppRoute.employeeListScreen);
              },
              child: Text(
                'Cancel',
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.blueDark,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              context.read<EmployeeBloc>().add(
                    UpdateEmployeeEvent(
                      oldEmployee: oldEmployee,
                      updatedEmployee: EmployeeModel(
                        name: employeeNameController.text,
                        dateOfJoining: startDateController.text,
                        dateOfLeaving: endDateController.text,
                        position: selectedRoleController.text,
                      ),
                    ),
                  );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 21,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: AppTheme.blueDark,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Save',
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
