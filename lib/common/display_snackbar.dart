import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../controllers/bloc/employee_bloc/employee_bloc.dart';
import '../routes.dart';

displaySnackbar({required final String message, required showUndoButton}) {
  AppNavigator.scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      backgroundColor: AppTheme.lightBlack,
      padding: const EdgeInsets.all(0),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: GestureDetector(
          onTap: () {
            AppNavigator.scaffoldMessengerKey.currentState
                ?.hideCurrentSnackBar();
          },
          child: Row(
            children: [
              Text(
                message,
                style: AppTheme.headingSmall.copyWith(color: Colors.white),
              ),
              const Spacer(),
              showUndoButton
                  ?
              GestureDetector(
                      onTap: () {
                        AppNavigator.scaffoldMessengerKey.currentState
                            ?.hideCurrentSnackBar();
                        AppNavigator.navigatorKey.currentContext
                            ?.read<EmployeeBloc>()
                            .add(UndoEmployeeDeletionEvent());
                      },
                      child: Text(
                        'Undo',
                        style: AppTheme.headingSmall.copyWith(
                          color: AppTheme.blueDark,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    ),
  );
}
