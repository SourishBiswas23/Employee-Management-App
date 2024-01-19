import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../app_theme.dart';

class StartAndEndDate extends StatefulWidget {
  const StartAndEndDate({super.key});

  @override
  State<StartAndEndDate> createState() => _StartAndEndDateState();
}

class _StartAndEndDateState extends State<StartAndEndDate> {
  final DateTime todaysDate = DateTime.now();
  DateTime startDate = DateTime.now();
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (date != null) {
                setState(() {
                  startDate = date;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                left: 8,
                right: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppTheme.greyMedium,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.event,
                    size: 24,
                    color: AppTheme.blueDark,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    startDate == todaysDate
                        ? 'Today'
                        : DateFormat('d MMM y').format(startDate),
                    style: AppTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/arrow_right.svg',
              height: 20,
              width: 20,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (date != null) {
                setState(() {
                  endDate = date;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                left: 8,
                right: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppTheme.greyMedium,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.event,
                    size: 24,
                    color: AppTheme.blueDark,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    endDate == null
                        ? 'No date'
                        : DateFormat('d MMM y').format(endDate!),
                    style: AppTheme.bodyMedium.copyWith(
                      color: endDate == null ? AppTheme.greyDark : null,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
