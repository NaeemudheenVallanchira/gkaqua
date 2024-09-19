class Farmer {
  String id;
  String name;
  String company;
  String contact;
  String location;
  String notes;

  Farmer({
    required this.id,
    required this.name,
    required this.company,
    required this.contact,
    required this.location,
    required this.notes,
  });

  Farmer.empty()
      : id = 'null',
        name = 'null',
        company = 'null',
        contact = 'null',
        location = 'null',
        notes = 'null';

  @override
  String toString() =>
      'Farmer { id: $id, name: $name, company: $company, contact: $contact, location: $location, notes: $notes }';

  factory Farmer.fromJson(Map<String, dynamic> json) {
    return Farmer(
      id: json['id'],
      name: json['name'],
      company: json['company'],
      contact: json['contact'],
      location: json['location'],
      notes: json['notes'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'contact': contact,
        'company': company,
        'location': location,
        'notes': notes,
      };
}
