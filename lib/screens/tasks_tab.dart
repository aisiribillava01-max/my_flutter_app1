import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/task_card.dart';
import 'task_detail_screen.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  void _submit(AppProvider app) {
    app.addTask(_titleController.text, _subjectController.text);
    _titleController.clear();
    _subjectController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'What do you need to study?',
              prefixIcon: Icon(Icons.edit_note),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _subjectController,
            decoration: const InputDecoration(
              hintText: 'Subject (optional)',
              prefixIcon: Icon(Icons.book_outlined),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _submit(app),
              icon: const Icon(Icons.add),
              label: const Text('Add Task'),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: app.tasks.isEmpty
                ? const Center(child: Text('No tasks yet — add one above!'))
                : ListView.builder(
                    itemCount: app.tasks.length,
                    itemBuilder: (context, index) {
                      final task = app.tasks[index];
                      return TaskCard(
                        task: task,
                        onCheckboxChanged: (_) => app.toggleDone(task.id),
                        onLongPress: () => app.toggleFavorite(task.id),
                        onTap: () {
                          // Passing data to the next screen via constructor.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TaskDetailScreen(task: task),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
