import 'package:bloc/bloc.dart';
import 'package:employee_management_app/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../common/display_snackbar.dart';
import '../../../models/employee.model.dart';
import '../../providers/employee_provider.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial()) {
    on<LoadEmployeesEvent>((event, emit) async {
      await _employeeProvider.loadEmployees();
      final allEmployees = _employeeProvider.employees;
      emit(AllEmployeesState(allEmployees: allEmployees));
    });
    on<DeleteEmployeeEvent>(
      (event, emit) async {
        AppNavigator.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        await _employeeProvider.deleteEmployee(employee: event.employee);
        displaySnackbar(
          message: 'Employee data has been deleted',
          showUndoButton: true,
        );
        deletedEmployee = event.employee;
        await _employeeProvider.loadEmployees();
        final allEmployees = _employeeProvider.employees;
        emit(AllEmployeesState(allEmployees: allEmployees));
      },
    );
    on<UndoEmployeeDeletionEvent>((event, emit) async {
      if (deletedEmployee != null) {
        await _employeeProvider.saveEmployee(employee: deletedEmployee!);
        deletedEmployee = null;
        await _employeeProvider.loadEmployees();
        final allEmployees = _employeeProvider.employees;
        emit(AllEmployeesState(allEmployees: allEmployees));
      }
    });
    on<UpdateEmployeeEvent>(
      (event, emit) async {
        _employeeProvider.updateEmployee(
          oldEmployee: event.oldEmployee,
          updatedEmployee: event.updatedEmployee,
        );
        await _employeeProvider.loadEmployees();
        final allEmployees = _employeeProvider.employees;
        emit(AllEmployeesState(allEmployees: allEmployees));
      },
    );
    on<CreateEmployeeEvent>((event, emit) async {
      bool error = false;
      if (event.employee.name.isEmpty) {
        AppNavigator.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        displaySnackbar(
          message: 'Employee Name Cannot Be Empty',
          showUndoButton: false,
        );
        error = true;
      } else if (event.employee.position.isEmpty) {
        AppNavigator.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        displaySnackbar(
          message: 'Please select position of the employee',
          showUndoButton: false,
        );
        error = true;
      } else if (event.employee.dateOfJoining.isEmpty) {
        AppNavigator.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        displaySnackbar(
          message: 'Please select joining date',
          showUndoButton: false,
        );
        error = true;
      }
      if (!error) {
        await _employeeProvider.saveEmployee(employee: event.employee);
        await _employeeProvider.loadEmployees();
        final allEmployees = _employeeProvider.employees;
        emit(AllEmployeesState(allEmployees: allEmployees));
        AppNavigator.pushReplace(route: AppRoute.employeeListScreen);
      }
    });
  }
  final EmployeeProvider _employeeProvider = EmployeeProvider();
  EmployeeModel? deletedEmployee;
}
