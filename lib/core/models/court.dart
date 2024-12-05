class Court {
  Court({
    required this.id,
    required this.courtName,
    required this.type,
    required this.availableDate,
    required this.rainy,
    required this.availableSchedule,
    required this.image,
    required this.cost,
  });

  int id;
  String courtName;
  String type;
  int rainy;
  String availableDate;
  String availableSchedule;
  String image;
  String cost;

  factory Court.fromJson(Map<String, dynamic> json) {
    return Court(
        id: json['id'],
        courtName: json['courtName'] ?? '',
        type: json['type'] ?? '',
        availableDate: json['availableDate'] ?? '',
        rainy: json['rainy'] ?? 0,
        availableSchedule: json['availableSchedule'] ?? '',
        image: json['image'] ?? '',
        cost: json['cost'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courtName': courtName,
      'type': type,
      'availableDate': availableDate,
      'rainy': rainy,
      'availableSchedule': availableDate,
      'image': image,
      'cost': cost
    };
  }

  @override
  String toString() {
    return 'courtName: $courtName, type: $type $availableDate rainy $rainy $availableSchedule image: $image cost: $cost';
  }
}
