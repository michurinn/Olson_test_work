import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String getCommentDate() {
    return DateFormat('d MMM y HH:mm').format(this);
  }
}
