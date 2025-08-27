class JournalModel {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;

  JournalModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory JournalModel.fromJson(Map<String, dynamic> json) {
    return JournalModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }
}
