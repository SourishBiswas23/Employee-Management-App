import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../app_theme.dart';

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

  @override
  void initState() {
    final dateNow = DateTime.now();
    todaysDate = DateTime(dateNow.year, dateNow.month, dateNow.day);
    widget.startDateController.text = todaysDate.toString();
    joiningDate = todaysDate;
    super.initState();
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
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
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
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (date != null) {
                setState(() {
                  leavingDate = date;
                  widget.endDateController.text = date.toString();
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
