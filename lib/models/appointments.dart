class Appointment {
  final int id;
  final DateTime date;
  final String hour;
  final String status;
  final int? durationMinutes;
  final String? vetName;
  final String? petName;
  final String? specialityName;
  final String? branchDirection;

  Appointment({
    required this.id,
    required this.date,
    required this.hour,
    required this.status,
    this.durationMinutes,
    this.vetName,
    this.petName,
    this.specialityName,
    this.branchDirection,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      hour: json['hour'] as String,
      status: json['status'] as String,
      durationMinutes: json['duration_minutes'] as int?,
      vetName: json['vet']?['name'] as String?,
      petName: json['pet']?['name'] as String?,
      specialityName: json['speciality']?['name'] as String?,
      branchDirection: json['branch']?['direction'] as String?,
    );
  }
}
