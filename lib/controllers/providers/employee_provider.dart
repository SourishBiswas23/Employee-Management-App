import 'package:flutter/foundation.dart';

import '../../models/employee.model.dart';
import '../repository/database_service.dart';

class EmployeeProvider extends ChangeNotifier {
  List<EmployeeModel> _employees = [];

  List<EmployeeModel> get employees => _employees;

  Future<void> loadEmployees() async {
    _employees = DatabaseService.getAllEmployees();
  }

  Future<void> editEmployee({
    required EmployeeModel oldEmployee,
    required EmployeeModel updatedEmployee,
  }) async {
    await DatabaseService.modifyEmployee(
      updatedEmployee: updatedEmployee,
      oldEmployee: oldEmployee,
    );
  }

  Future<void> saveEmployee({required EmployeeModel employee}) async {
    await DatabaseService.saveEmployee(employee: employee);
  }

  @override
  void dispose() {
    DatabaseService.closeBox();
    super.dispose();
  }
}
