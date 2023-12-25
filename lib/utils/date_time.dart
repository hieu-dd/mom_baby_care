extension DateTimeEx on DateTime {
  Map<String, int> calculateTimeDifference(DateTime pastDate) {
    DateTime currentDate = this;
    if (currentDate.isBefore(pastDate)) {
      return {'years': 0, 'months': 0, 'days': 0};
    }

    int years = currentDate.year - pastDate.year;
    int months = currentDate.month - pastDate.month;
    int days = currentDate.day - pastDate.day;

    years = currentDate.year - pastDate.year;

    if (currentDate.month >= pastDate.month) {
      months = currentDate.month - pastDate.month;
    } else {
      months = currentDate.month - pastDate.month + 12;
      years--;
    }

    if (currentDate.day >= pastDate.day) {
      days = currentDate.day - pastDate.day;
    } else {
      int month = (currentDate.month - 1) % 12;
      int year = month == 12 ? currentDate.year - 1 : currentDate.year;
      DateTime lastDayOfPreviousMonth = DateTime(year, month + 1, 0);
      days = lastDayOfPreviousMonth.day - pastDate.day + currentDate.day;
      if (months == 0) {
        months = 11;
        years--;
      } else {
        months--;
      }
    }

    return {'years': years, 'months': months, 'days': days};
  }
}
