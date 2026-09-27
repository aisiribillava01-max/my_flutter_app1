import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../widgets/quote_card.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppProvider>();
    final total = app.tasks.length;
    final done = app.completedCount;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Image.asset('assets/images/logo.png', width: 56, height: 56),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Hi, ${app.studentName.split(' ').first}!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const QuoteCard(),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _StatCard(label: 'Total Tasks', value: '$total')),
            const SizedBox(width: 12),
            Expanded(child: _StatCard(label: 'Completed', value: '$done')),
            const SizedBox(width: 12),
            Expanded(child: _StatCard(label: 'Favorites', value: '${app.favorites.length}')),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(value, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 4),
            Text(label, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
