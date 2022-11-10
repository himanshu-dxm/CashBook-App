

class MyDateTime {
  int date;
  String month;
  String day;
  int year;
  int hour;
  int min;

  MyDateTime({
    required this.date,
    required this.month,
    required this.day,
    required this.year,
    required this.hour,
    required this.min,
  });
  factory MyDateTime.fromJson(Map<String,dynamic> json) => MyDateTime(
    date: json['date'],
    month: json['month'],
    day: json['day'],
    year: json['year'],
    hour: json['hour'],
    min: json['min']
  );

  Map<String,dynamic> toJson() => {
    "date":date,
    "month":month,
    "day":day,
    "year":year,
    "hour":hour,
    "min":min,
  };
}