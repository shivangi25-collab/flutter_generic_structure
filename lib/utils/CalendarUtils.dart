final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year - 12, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year + 12, kToday.month, kToday.day);

DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday - 1));
}

DateTime findLastDateOfTheWeek(DateTime dateTime) {
  return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime startDate, DateTime endDate) {
  final dayCount = endDate.difference(startDate).inDays + 1;
  return List.generate(
    dayCount,
    (index) =>
        DateTime.utc(startDate.year, startDate.month, startDate.day + index),
  );
}
