import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_theme.dart';
import '../../common/format_date_string.dart';
import '../../controllers/bloc/employee_bloc/employee_bloc.dart';
import '../../models/employee.model.dart';

class DismissibleListTile extends StatefulWidget {
  const DismissibleListTile({
    required super.key,
    required this.employee,
  });

  final EmployeeModel employee;

  @override
  State<DismissibleListTile> createState() => _DismissibleListTileState();
}

class _DismissibleListTileState extends State<DismissibleListTile> {
  late final String name;
  late final String position;
  late final String joiningDate;
  late final String leavingDate;

  @override
  void initState() {
    name = widget.employee.name;
    position = widget.employee.position;
    joiningDate = formatDateString(
      dateString: widget.employee.dateOfJoining,
    );
    leavingDate = formatDateString(
      dateString: widget.employee.dateOfLeaving,
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        context
            .read<EmployeeBloc>()
            .add(DeleteEmployeeEvent(employee: widget.employee));
      },
      key: widget.key!,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        color: AppTheme.red,
        child: SvgPicture.asset(
          'assets/images/delete_icon.svg',
          height: 24,
          width: 24,
          fit: BoxFit.cover,
        ),
      ),
      direction: DismissDirection.endToStart,
      
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AppTheme.greyLight,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTheme.headingMedium.copyWith(
                color: AppTheme.lightBlack,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              position,
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.greyDark,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$joiningDate ${leavingDate.isEmpty ? '' : ' - $leavingDate'}',
              style: AppTheme.bodySmall.copyWith(
                color: AppTheme.greyDark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
