import 'package:intl/intl.dart';

extension DateExtension on DateTime{
  String get getDayMonthFromDateTime{
    return DateFormat("d MMM").format(this);
  }
  String  get toFormattedDate{
    return DateFormat("dd-MM-yyyy").format(this);
  }
  String  get getFormattedTime{
    return  DateFormat('hh:mm').format(this);
  }
}