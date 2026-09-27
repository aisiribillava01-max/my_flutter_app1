import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';

class QuoteCard extends StatefulWidget {
  const QuoteCard({super.key});

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  final QuoteService _service = QuoteService();
  late Future<Quote> _tipFuture;

  @override
  void initState() {
    super.initState();
    _tipFuture = _service.fetchTipOfTheDay();
  }

  void _refresh() {
    setState(() {
      _tipFuture = _service.fetchTipOfTheDay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: FutureBuilder<Quote>(
          future: _tipFuture,
          builder: (context, snapshot) {
            Widget content;
            if (snapshot.connectionState == ConnectionState.waiting) {
              content = const SizedBox(
                height: 40,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              content = const Text(
                "Couldn't fetch a tip — check your connection.",
                style: TextStyle(fontFamily: 'Kalam'),
              );
            } else {
              content = Text(
                '"${snapshot.data!.text}"',
                style: Theme.of(context).textTheme.bodyMedium,
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.lightbulb, color: Color(0xFFFFD166), size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tip of the Day', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      content,
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _refresh,
                  tooltip: 'Get another tip',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
