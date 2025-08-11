class HistoryPet {
  final int idEntry;
  final int idPet;
  final int idAppointment;
  final DateTime? record;
  final String treatmentDetal;
  final String observations;

  HistoryPet({
    required this.idEntry,
    required this.idPet,
    required this.idAppointment,
    this.record,
    required this.treatmentDetal,
    required this.observations,
  });

  factory HistoryPet.fromJson(Map<String, dynamic> json) {
    return HistoryPet(
      idEntry: json['id_entry'] as int,
      idPet: json['id_pet'] as int,
      idAppointment: json['id_appointment'] as int,
      record: json['record'] != null ? DateTime.parse(json['record']) : null,
      treatmentDetal: json['treatment_detal'] ?? '',
      observations: json['observations'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id_entry': idEntry,
        'id_pet': idPet,
        'id_appointment': idAppointment,
        'record': record?.toIso8601String(),
        'treatment_detal': treatmentDetal,
        'observations': observations,
      };
}
