import 'package:flutter/material.dart';

import '../../app_theme.dart';

class SelectRoleButton extends StatefulWidget {
  const SelectRoleButton({
    super.key,
    required this.selectedRoleController,
    required this.focusScopeNode,
  });
  final TextEditingController selectedRoleController;
  final FocusScopeNode focusScopeNode;

  @override
  State<SelectRoleButton> createState() => _SelectRoleButtonState();
}

class _SelectRoleButtonState extends State<SelectRoleButton> {
  
  List<String> availableRoles = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner',
  ];

  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.focusScopeNode.unfocus();
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: availableRoles.map((role) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      selectedRole = role;
                      widget.selectedRoleController.text = role;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: AppTheme.greyLight),
                      ),
                    ),
                    child: Text(
                      role,
                      style: AppTheme.bodyLarge.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppTheme.lightBlack,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
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
              Icons.work_outline,
              color: AppTheme.blueDark,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              selectedRole == null ? 'Select role' : selectedRole!,
              style: AppTheme.bodyLarge.copyWith(
                fontWeight: FontWeight.w400,
                color: selectedRole == null
                    ? AppTheme.greyDark
                    : AppTheme.lightBlack,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_drop_down_rounded,
              color: AppTheme.blueDark,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
