class Appointment {
  final int id;
  final DateTime date;
  final String hour;
  final String status;
  final String vetName;
  final String specialityName;
  final String location;

  Appointment({
    required this.id,
    required this.date,
    required this.hour,
    required this.status,
    required this.vetName,
    required this.specialityName,
    required this.location,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      date: DateTime.parse(json['date']),
      hour: json['hour'],
      status: json['status'],
      vetName: json['vet']['name'],
      specialityName: json['speciality']['name'],
      location: json['branch']['direction'],
    );
  }
}
