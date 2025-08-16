class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String role;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.role,
    required this.createdAt,
  });

  // Factory method for placeholder data
  factory User.placeholder() {
    return User(
      id: '1',
      name: 'John Doe',
      email: 'johndoe@example.com',
      avatarUrl: 'https://via.placeholder.com/150',
      role: 'User',
      createdAt: DateTime.now(),
    );
  }

  // From JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      role: json['role'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
