class RecentReadings {
  int? i1;
  int? i3;
  int? i8;
  int? i24;
  int? i168;

  RecentReadings({
    this.i1,
    this.i3,
    this.i8,
    this.i24,
    this.i168,
  });

  factory RecentReadings.fromJson(Map<String, dynamic> json) {
    return RecentReadings(
      i1: json['1'],
      i3: json['3'],
      i8: json['8'],
      i24: json['24'],
      i168: json['168'],
    );
  }
}
