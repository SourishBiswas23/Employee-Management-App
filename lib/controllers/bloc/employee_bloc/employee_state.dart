part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState extends Equatable {
  final List<EmployeeModel> allEmployees = [];

  @override
  List<Object> get props => [allEmployees];
}

final class EmployeeInitial extends EmployeeState {}

final class AllEmployeesState extends EmployeeState {
  AllEmployeesState({required this.allEmployees});

  @override
  final List<EmployeeModel> allEmployees;
}
