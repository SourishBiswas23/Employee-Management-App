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

  late final TextEditingController employeeNameController;
  late final TextEditingController selectedRoleController;
  late final TextEditingController startDateController;
  late final TextEditingController endDateController;
  late final FocusScopeNode focusScopeNode;

  @override
  void initState() {
    employeeNameController = TextEditingController();
    selectedRoleController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    focusScopeNode = FocusScopeNode();

    employeeNameController.text = '';
    selectedRoleController.text = '';
    startDateController.text = '';
    endDateController.text = '';

    super.initState();
  }

  @override
  void dispose() {
    employeeNameController.dispose();
    selectedRoleController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    focusScopeNode.dispose();
    super.dispose();
  }
  

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
        child: Column(
          children: [
            EmployeeNameTextField(
              employeeNameController: employeeNameController,
              focusScopeNode: focusScopeNode,
            ),
            const SizedBox(height: 23),
            SelectRoleButton(
              selectedRoleController: selectedRoleController,
              focusScopeNode: focusScopeNode,
            ),
            const SizedBox(height: 23),
            StartAndEndDate(
              endDateController: endDateController,
              startDateController: startDateController,
              focusScopeNode: focusScopeNode,
            ),
            const Spacer(),
            const Divider(color: AppTheme.greyLight),
            CancelAndSaveButtons(
              employeeNameController: employeeNameController,
              endDateController: endDateController,
              selectedRoleController: selectedRoleController,
              startDateController: startDateController,
            ),
          ],
        ),
      ),
    );
  }
}
