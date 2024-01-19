import 'package:flutter/material.dart';

import '../../app_theme.dart';
import 'cancel_and_save_buttons.dart';
import 'employee_name_text_field.dart';
import 'select_role_button.dart';
import 'start_and_end_date.dart';

class AddEmployeeDetailsScreen extends StatefulWidget {
  const AddEmployeeDetailsScreen({super.key});

  @override
  State<AddEmployeeDetailsScreen> createState() =>
      _AddEmployeeDetailsScreenState();
}

class _AddEmployeeDetailsScreenState extends State<AddEmployeeDetailsScreen> {
  late final GlobalKey<FormState> formKey = GlobalKey();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.blueDark,
        title: Text(
          'Add Employee Details',
          style: AppTheme.headingLarge.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
        ),
        child: Form(
          key: formKey,
          child: const Column(
            children: [
              EmployeeNameTextField(),
              SizedBox(height: 23),
              SelectRoleButton(),
              SizedBox(height: 23),
              StartAndEndDate(),
              Spacer(),
              Divider(color: AppTheme.greyLight),
              CancelAndSaveButtons()
            ],
          ),
        ),
      ),
    );
  }
}
