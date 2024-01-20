import 'package:hive_flutter/hive_flutter.dart';

import '../../common/generate_key.dart';
import '../../models/employee.model.dart';

class DatabaseService {
  static late Box<EmployeeModel> _employeeBox;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(EmployeeModelAdapter());
    _employeeBox = await Hive.openBox<EmployeeModel>('employeeBox');
  }

  static List<EmployeeModel> getAllEmployees() {
    return _employeeBox.values.toList();
  }

  static Future<void> saveEmployee({required EmployeeModel employee}) async {
    final key = generateKey(employee: employee);
    await _employeeBox.put(key, employee);
  }

  static Future<void> updateEmployee({
    required EmployeeModel updatedEmployee,
    required EmployeeModel oldEmployee,
  }) async {
    final key = generateKey(employee: oldEmployee);
    await _employeeBox.delete(key);
    await saveEmployee(employee: updatedEmployee);
  }

  static Future<void> deleteEmployee({required EmployeeModel employee}) async {
    final key = generateKey(employee: employee);
    await _employeeBox.delete(key);
  }

  static Future<void> closeBox() async {
    await Hive.close();
  }
}
