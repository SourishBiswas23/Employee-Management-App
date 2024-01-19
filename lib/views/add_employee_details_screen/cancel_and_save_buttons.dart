import 'package:flutter/material.dart';

import '../../app_theme.dart';

class CancelAndSaveButtons extends StatelessWidget {
  const CancelAndSaveButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppTheme.blueLight,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Cancel',
              style: AppTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppTheme.blueDark,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 21,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppTheme.blueDark,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Save',
              style: AppTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
