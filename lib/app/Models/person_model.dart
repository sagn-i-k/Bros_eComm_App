class Person {
  final String name;
  final String description;

  Person({
    required this.name,
    required this.description,
  });

  // Optional: You can add a factory constructor for JSON conversion
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }

  // Optional: Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
}