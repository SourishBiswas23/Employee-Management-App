import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_theme.dart';

class DismissibleListTile extends StatelessWidget {
  const DismissibleListTile({
    super.key,
    required this.employeeKey,
    required this.name,
    required this.position,
    required this.joiningDate,
    required this.leavingDate,
  });

  final int employeeKey;
  final String name;
  final String position;
  final String joiningDate;
  final String leavingDate;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
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
      key: ValueKey<int>(employeeKey),
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
            )
          ],
        ),
      ),
    );
  }
}
