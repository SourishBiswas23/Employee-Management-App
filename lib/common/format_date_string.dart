import 'package:intl/intl.dart';

String formatDateString({required String dateString}) {
  if (dateString.isEmpty) {
    return '';
  }
  final dateFormat = DateFormat("dd MMM, yyyy", 'en');
  final dateObject = DateTime.parse(dateString);
  final formattedDate = dateFormat.format(dateObject);
  return formattedDate;
}
