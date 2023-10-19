import 'package:intl/intl.dart';

class DateConverter {
  final String dateString;

  DateConverter({required this.dateString});

  String monthInstring() {
    DateTime date = DateTime.parse(dateString);
    String monthInWords = DateFormat('MMMM').format(date);
    return monthInWords;
  }
    String dayinString() {
    DateTime date = DateTime.parse(dateString);
    String dayInWords = DateFormat('EEEE').format(date);
    return dayInWords;
  }
    String convertToString() {
    DateTime date = DateTime.parse(dateString);
    int dayInNumber = date.day;
    return dayInNumber.toString();
  }

}