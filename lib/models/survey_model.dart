class Survey {
  final String referenceNumber;
  final String institution;
  final String location;
  final String initiatedDate;
  final String status;
  final String statusColor;

  Survey({
    required this.referenceNumber,
    required this.institution,
    required this.location,
    required this.initiatedDate,
    required this.status,
    required this.statusColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'reference_number': referenceNumber,
      'institution': institution,
      'location': location,
      'initiated_date': initiatedDate,
      'status': status,
      'status_color': statusColor,
    };
  }

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
      referenceNumber: map['reference_number'],
      institution: map['institution'],
      location: map['location'],
      initiatedDate: map['initiated_date'],
      status: map['status'],
      statusColor: map['status_color'],
    );
  }
}
