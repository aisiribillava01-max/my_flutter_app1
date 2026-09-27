import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/task_card.dart';
import 'task_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final favorites = app.favorites;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
          ? const Center(child: Text('Long-press a task to favorite it.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final task = favorites[index];
                return TaskCard(
                  task: task,
                  onCheckboxChanged: (_) => app.toggleDone(task.id),
                  onLongPress: () => app.toggleFavorite(task.id),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TaskDetailScreen(task: task)),
                  ),
                );
              },
            ),
    );
  }
}
