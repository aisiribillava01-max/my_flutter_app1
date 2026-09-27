import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/app_provider.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    // Always read the freshest copy of this task from the provider's list,
    // since favorite/done state may have changed elsewhere.
    final current = app.tasks.firstWhere((t) => t.id == task.id, orElse: () => task);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [
          // GestureDetector used for a custom tappable icon in the AppBar.
          GestureDetector(
            onTap: () => app.toggleFavorite(current.id),
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                current.isFavorite ? Icons.star : Icons.star_border,
                color: const Color(0xFFFFD166),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(current.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            Chip(label: Text(current.subject)),
            const SizedBox(height: 16),
            Text(
              current.description.isEmpty ? 'No extra notes for this task.' : current.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => app.toggleDone(current.id),
                icon: Icon(current.isDone ? Icons.undo : Icons.check),
                label: Text(current.isDone ? 'Mark as Not Done' : 'Mark as Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
