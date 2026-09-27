import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final ValueChanged<bool?> onCheckboxChanged;

  const TaskCard({
    super.key,
    required this.task,
    required this.onTap,
    required this.onLongPress,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector: tap opens details, long-press toggles favorite.
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Checkbox(value: task.isDone, onChanged: onCheckboxChanged),
          title: Text(
            task.title,
            style: TextStyle(
              fontFamily: 'Kalam',
              fontWeight: FontWeight.w700,
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.subject, style: const TextStyle(fontFamily: 'Kalam')),
          trailing: Icon(
            task.isFavorite ? Icons.star : Icons.star_border,
            color: task.isFavorite ? const Color(0xFFFFD166) : Colors.grey,
          ),
        ),
      ),
    );
  }
}
