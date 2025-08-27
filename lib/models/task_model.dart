class TaskModel {
  final int id;
  final bool progress;
  final String title;
  final String description;
  final DateTime date;
  final DateTime? completeDate;

  TaskModel({
    required this.id,
    required this.title,
    required this.progress,
    required this.description,
    required this.date,
    this.completeDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? 0,
      progress: json['progress'] ?? false,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      completeDate: json['completeDate'] != null && json['completeDate'] != ''
          ? DateTime.tryParse(json['completeDate'])
          : null,
    );
  }
}
