class Panchayath {
  final String id;
  final String name;

  Panchayath({required this.id, required this.name});

  factory Panchayath.fromMap(Map<String, dynamic> map) {
    return Panchayath(
      id: map['id'],
      name: map['name'],
    );
  }
}

class Complaint {
  final String id;
  final String description;
  final DateTime dateSubmitted;
  final String status;

  Complaint({
    required this.id,
    required this.description,
    required this.dateSubmitted,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'dateSubmitted': dateSubmitted.toIso8601String(),
      'status': status,
    };
  }
}