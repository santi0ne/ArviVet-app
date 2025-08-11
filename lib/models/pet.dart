class Pet {
  final int id;
  final String? pic;
  final String name;
  final DateTime birthDate;
  final String breed;
  final String sex;
  final double weigth;
  final String countryOrigin;
  final DateTime? sterilizationDate;
  final int ownerId;

  Pet({
    required this.id,
    this.pic,
    required this.name,
    required this.birthDate,
    required this.breed,
    required this.sex,
    required this.weigth,
    required this.countryOrigin,
    this.sterilizationDate,
    required this.ownerId,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] as int,
      pic: json['pic'] as String?,
      name: json['name'] as String,
      birthDate: DateTime.parse(json['birth_date']),
      breed: json['breed'] as String,
      sex: json['sex'] as String,
      weigth: (json['weigth'] as num).toDouble(),
      countryOrigin: json['country_origin'] as String,
      sterilizationDate: json['sterilization_date'] != null
          ? DateTime.tryParse(json['sterilization_date'])
          : null,
      ownerId: json['owner_id'] as int,
    );
  }
}
