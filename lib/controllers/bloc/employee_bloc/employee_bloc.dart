import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../common/display_snackbar.dart';
import '../../../models/employee.model.dart';
import '../../../routes.dart';
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
        bool error = false;
        String? errorMessage = isDateValid(
          dateOfJoining: event.updatedEmployee.dateOfJoining,
          dateOfLeaving: event.updatedEmployee.dateOfLeaving,
        );
        if (event.updatedEmployee.name.isEmpty) {
          AppNavigator.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
          displaySnackbar(
            message: 'Employee Name Cannot Be Empty',
            showUndoButton: false,
          );
          error = true;
        } else if (event.updatedEmployee.position.isEmpty) {
          AppNavigator.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
          displaySnackbar(
            message: 'Please select position of the employee',
            showUndoButton: false,
          );
          error = true;
        } else if (event.updatedEmployee.dateOfJoining.isEmpty) {
          AppNavigator.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
          displaySnackbar(
            message: 'Please select joining date',
            showUndoButton: false,
          );
          error = true;
        }
        else if (errorMessage != null) {
          error = true;
          displaySnackbar(message: errorMessage, showUndoButton: false);
        }
        if (!error) {
          await _employeeProvider.updateEmployee(
            oldEmployee: event.oldEmployee,
            updatedEmployee: event.updatedEmployee,
          );
          await _employeeProvider.loadEmployees();
          final allEmployees = _employeeProvider.employees;
          emit(AllEmployeesState(allEmployees: allEmployees));
          AppNavigator.pushReplace(route: AppRoute.employeeListScreen);
        }
        
      },
    );
    on<CreateEmployeeEvent>((event, emit) async {
      bool error = false;
      String? errorMessage = isDateValid(
        dateOfJoining: event.employee.dateOfJoining,
        dateOfLeaving: event.employee.dateOfLeaving,
      );
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
      else if (errorMessage != null) {
        error = true;
        displaySnackbar(message: errorMessage, showUndoButton: false);
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

String? isDateValid({
  required String dateOfJoining,
  required String? dateOfLeaving,
}) {
  DateTime startDate = DateTime.parse(dateOfJoining);
  DateTime? endDate = DateTime.tryParse(dateOfLeaving ?? '');
  DateTime _ = DateTime.now().toLocal();
  DateTime todaysDate = DateTime(_.year, _.month, _.day);
  if (endDate != null) {
    if (startDate.isAfter(endDate)) {
      return 'Joining date cannot be after Leaving date';
    } else if (todaysDate.isBefore(endDate)) {
      return 'Leaving date cannot be in the future';
    }
  }
  return null;
}
