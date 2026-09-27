import 'package:flutter/material.dart';
import '../models/task.dart';

class AppProvider extends ChangeNotifier {
  // ---- Theme state ----
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // ---- Student name (used across screens) ----
  String _studentName = 'Aanya Sharma';
  String get studentName => _studentName;

  void updateName(String name) {
    if (name.trim().isEmpty) return;
    _studentName = name.trim();
    notifyListeners();
  }

  // ---- Tasks state ----
  int _nextId = 4;
  final List<Task> _tasks = [
    Task(id: 1, title: 'Finish DSA assignment', subject: 'CS201', description: 'Solve the linked-list problem set and submit on the portal before midnight.'),
    Task(id: 2, title: 'Revise Thermodynamics', subject: 'ME150', description: 'Go through chapter 4 notes and attempt last year\'s question paper.'),
    Task(id: 3, title: 'Prepare seminar slides', subject: 'HSS101', description: 'Create a 10-slide deck on communication skills for Monday\'s seminar.'),
  ];

  List<Task> get tasks => List.unmodifiable(_tasks);
  List<Task> get favorites => _tasks.where((t) => t.isFavorite).toList();
  int get completedCount => _tasks.where((t) => t.isDone).length;

  void addTask(String title, String subject) {
    if (title.trim().isEmpty) return;
    _tasks.add(Task(
      id: _nextId++,
      title: title.trim(),
      subject: subject.trim().isEmpty ? 'General' : subject.trim(),
    ));
    notifyListeners();
  }

  void toggleDone(int id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void toggleFavorite(int id) {
    final task = _tasks.firstWhere((t) => t.id == id);
    task.isFavorite = !task.isFavorite;
    notifyListeners();
  }
}
