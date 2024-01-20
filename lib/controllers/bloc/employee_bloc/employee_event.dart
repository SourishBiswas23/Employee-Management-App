part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

class LoadEmployeesEvent extends EmployeeEvent {}

class DeleteEmployeeEvent extends EmployeeEvent {
  DeleteEmployeeEvent({required this.employee});
  final EmployeeModel employee;
}

class UpdateEmployeeEvent extends EmployeeEvent {
  UpdateEmployeeEvent({
    required this.oldEmployee,
    required this.updatedEmployee,
  });
  final EmployeeModel oldEmployee;
  final EmployeeModel updatedEmployee;
}

class CreateEmployeeEvent extends EmployeeEvent {
  CreateEmployeeEvent({required this.employee});
  final EmployeeModel employee;
}

class UndoEmployeeDeletionEvent extends EmployeeEvent {}
