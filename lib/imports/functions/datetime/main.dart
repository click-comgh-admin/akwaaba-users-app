import 'package:intl/intl.dart';

DateFormat _formater(String format) {
  return DateFormat(format);
}

formatDateDatetimeFunction(DateTime dateTime, {String format = "yyyy-MM-dd"}) {
  DateFormat formater = _formater(format);
  return formater.format(dateTime);
}


formatTimeDatetimeFunction(DateTime dateTime, {String format = "h:m a"}) {
  DateFormat formater = _formater(format);
  return formater.format(dateTime);
}