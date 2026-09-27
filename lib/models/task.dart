class Task {
  final int id;
  final String title;
  final String subject;
  final String description;
  bool isDone;
  bool isFavorite;

  Task({
    required this.id,
    required this.title,
    required this.subject,
    this.description = '',
    this.isDone = false,
    this.isFavorite = false,
  });
}
