class Employee {
  String name;
  String position;
  String nationality;
  String passportNumber;
  DateTime? startDate;
  DateTime? endDate;
  String gender;

  Employee({
    required this.name,
    required this.position,
    required this.nationality,
    required this.passportNumber,
    this.startDate,
    this.endDate,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'position': position,
      'nationality': nationality,
      'start_date': startDate != null ? startDate!.toString().substring(0, 10) : "",
      'end_date': endDate != null ? endDate!.toString().substring(0, 10) : "",
      'passport': passportNumber,
      'gender': gender,
    };
  }
}
