class Quote {
  final String text;

  Quote({required this.text});

  factory Quote.fromJson(Map<String, dynamic> json) {
    // adviceslip.com returns: { "slip": { "id": 1, "advice": "..." } }
    final slip = json['slip'] as Map<String, dynamic>;
    return Quote(text: slip['advice'] as String);
  }
}
