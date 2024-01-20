import 'package:flutter/material.dart';

import '../../app_theme.dart';

class EmployeeNameTextField extends StatelessWidget {
  const EmployeeNameTextField({
    super.key,
    required this.employeeNameController,
    required this.focusScopeNode,
  });
  final TextEditingController employeeNameController;
  final FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    final textFieldBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: AppTheme.greyMedium,
        width: 1,
      ),
    );

    return TextField(
      focusNode: focusScopeNode,
      controller: employeeNameController,
      cursorColor: AppTheme.blueDark,
      decoration: InputDecoration(
        hintText: 'Employee Name',
        hintStyle: AppTheme.bodyLarge.copyWith(
          fontWeight: FontWeight.w400,
          color: AppTheme.greyDark,
        ),
        prefixIcon: const Icon(
          Icons.person_outline,
          size: 24,
        ),
        prefixIconColor: AppTheme.blueDark,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        border: textFieldBorderStyle,
        enabledBorder: textFieldBorderStyle,
        focusedBorder: textFieldBorderStyle,
      ),
      style: AppTheme.bodyLarge.copyWith(
        fontWeight: FontWeight.w400,
        color: AppTheme.lightBlack,
      ),
    );
  }
}
