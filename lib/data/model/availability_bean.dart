class Availability {
  String day;
  bool isClosed;
  List<AvailabilityTiming> timing;

  Availability({
    required this.day,
    required this.isClosed,
    required this.timing,
  });
}

class AvailabilityTiming {
  String startTime;
  String endTime;
  String id;

  AvailabilityTiming({
    required this.startTime,
    required this.endTime,
    this.id = "",
  });
}
