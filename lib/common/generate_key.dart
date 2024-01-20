import '../models/employee.model.dart';

String generateKey({required EmployeeModel employee}) {
  return '${employee.name}_${employee.position}_${employee.dateOfJoining}_${employee.dateOfLeaving}';
}
