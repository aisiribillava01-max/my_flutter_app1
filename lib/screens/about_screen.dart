import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About StudyMate')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo.png', width: 72, height: 72),
            const SizedBox(height: 16),
            Text('StudyMate', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(
              'StudyMate is a small companion app for students: keep track of '
              'study tasks, star the important ones, and get a quick tip of '
              'the day pulled live from the web.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text('Built with Flutter · Provider · http', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
