import 'package:intl/intl.dart';

extension DateExtension on DateTime{
  String get getFormattedDate{
    return DateFormat("d MMM").format(this);
  }
}