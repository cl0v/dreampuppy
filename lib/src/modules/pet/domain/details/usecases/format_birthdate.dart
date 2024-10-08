abstract class FormatBirthDateUsecase {
  String call(DateTime date);
}

class FormatBirthDateUsecaseI implements FormatBirthDateUsecase {
  @override
  String call(DateTime date) {
    final month = date.month;
    final monthS = [
      "Jan",
      "Fev",
      "Mar",
      "Abr",
      "Mai",
      "Jun",
      "Jul",
      "Ago",
      "Set",
      "Out",
      "Nov",
      "Dez"
    ][month];
    final dayS = date.day.toString();
    final hourS = _put0OnTime(date.hour.toString());
    final minuteS = _put0OnTime(date.minute.toString());

    return 'Nascimento: $dayS $monthS as $hourS:$minuteS';
  }

  String _put0OnTime(String time) {
    if (time.length == 1) {
      return '0$time';
    }
    return time;
  }
}
