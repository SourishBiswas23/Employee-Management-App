import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar_null_safe/table_calendar_null_safe.dart';

import '../../app_theme.dart';
import '../../common/custom_date_picker.dart';

class StartAndEndDate extends StatefulWidget {
  const StartAndEndDate({
    super.key,
    required this.startDateController,
    required this.endDateController,
    required this.focusScopeNode,
  });
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final FocusScopeNode focusScopeNode;

  @override
  State<StartAndEndDate> createState() => _StartAndEndDateState();
}

class _StartAndEndDateState extends State<StartAndEndDate> {

  late final CalendarController calendarController;

  @override
  void initState() {
    final dateNow = DateTime.now();
    todaysDate = DateTime(dateNow.year, dateNow.month, dateNow.day);
    widget.startDateController.text = todaysDate.toString();
    joiningDate = todaysDate;
    calendarController = CalendarController();
    super.initState();
  }

  @override
  void dispose() {
    calendarController.dispose();
    super.dispose();
  }

  late final DateTime todaysDate;
  late DateTime joiningDate;
  DateTime? leavingDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              widget.focusScopeNode.unfocus();
              final date = await customDatePicker(
                context: context,
                selectedDate: joiningDate,
                calendarController: calendarController,
                isJoiningDate: true,
              );
              if (date != null) {
                setState(() {
                  joiningDate = date;
                  widget.startDateController.text = date.toString();
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
                    joiningDate == todaysDate
                        ? 'Today'
                        : DateFormat('d MMM y').format(joiningDate),
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
              widget.focusScopeNode.unfocus();
              final date = await customDatePicker(
                context: context,
                selectedDate: leavingDate,
                calendarController: calendarController,
                isJoiningDate: false,
              );
              setState(() {
                leavingDate = date;
                widget.endDateController.text =
                    date != null ? date.toString() : '';
              });
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
                    leavingDate == null
                        ? 'No date'
                        : DateFormat('d MMM y').format(leavingDate!),
                    style: AppTheme.bodyMedium.copyWith(
                      color: leavingDate == null ? AppTheme.greyDark : null,
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
