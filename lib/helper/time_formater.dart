String convertToAMPM(String time) {
  List<String> parts = time.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);

  String period = 'AM';
  if (hour >= 12) {
    period = 'PM';
    if (hour > 12) {
      hour -= 12;
    }
  }
  if (hour == 0) {
    hour = 12;
  }

  return '$hour:${minute.toString().padLeft(2, '0')} $period';
}
