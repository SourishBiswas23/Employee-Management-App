import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_theme.dart';
import '../../models/employee.model.dart';
import 'edit_employee_cancel_and_save_buttons.dart';
import 'edit_employee_name_text_field.dart';
import 'edit_employee_select_role_button.dart';
import 'edit_employee_start_and_end_date.dart';

class EditEmployeeDetailsScreen extends StatefulWidget {
  const EditEmployeeDetailsScreen({
    super.key,
    required this.employee,
  });
  final EmployeeModel employee;

  @override
  State<EditEmployeeDetailsScreen> createState() =>
      _EditEmployeeDetailsScreenState();
}

class _EditEmployeeDetailsScreenState extends State<EditEmployeeDetailsScreen> {
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

    employeeNameController.text = widget.employee.name;
    selectedRoleController.text = widget.employee.position;
    startDateController.text = widget.employee.dateOfJoining;
    endDateController.text = widget.employee.dateOfLeaving;

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Edit  Employee Details',
              style: AppTheme.headingLarge.copyWith(color: Colors.white),
            ),
            SvgPicture.asset(
              'assets/images/delete_icon.svg',
              height: 24,
              width: 24,
            )
          ],
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
            EditEmployeeNameTextField(
              employeeNameController: employeeNameController,
              focusScopeNode: focusScopeNode,
            ),
            const SizedBox(height: 23),
            EditEmployeeSelectRoleButton(
              selectedRoleController: selectedRoleController,
              focusScopeNode: focusScopeNode,
            ),
            const SizedBox(height: 23),
            EditEmployeeStartAndEndDate(
              endDateController: endDateController,
              startDateController: startDateController,
              focusScopeNode: focusScopeNode,
            ),
            const Spacer(),
            const Divider(color: AppTheme.greyLight),
            EditEmployeeCancelAndSaveButtons(
              employeeNameController: employeeNameController,
              endDateController: endDateController,
              selectedRoleController: selectedRoleController,
              startDateController: startDateController,
              oldEmployee: widget.employee,
            ),
          ],
        ),
      ),
    );
  }
}
