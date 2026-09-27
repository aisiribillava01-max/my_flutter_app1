import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote.dart';

class QuoteService {
  static const _url = 'https://api.adviceslip.com/advice';

  /// Fetches a random "tip of the day" from a free public API.
  /// Throws an [Exception] if the request fails.
  Future<Quote> fetchTipOfTheDay() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Quote.fromJson(data);
    } else {
      throw Exception('Failed to load tip (status ${response.statusCode})');
    }
  }
}
