import 'package:flutter/foundation.dart';

class Joke {
  final bool error;
  final String category;
  final String type;
  final String jokesingle;
  final String setup;
  final String delivery;
  final Flags flags;
  final bool safe;
  final int id;
  final String lang;

  Joke({
    required this.error,
    required this.category,
    required this.type,
    required this.jokesingle,
    required this.setup,
    required this.delivery,
    required this.flags,
    required this.safe,
    required this.id,
    required this.lang,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      error: json['error'] ?? false,
      category: json['category'] ?? '',
      type: json['type'] ?? '',
      jokesingle: json['joke'] ?? '',
      setup: json['setup'] ?? '',
      delivery: json['delivery'] ?? '',
      flags: Flags.fromJson(json['flags']),
      safe: json['safe'] ?? true,
      id: json['id'] ?? 0,
      lang: json['lang'] ?? '',
    );
  }
}

class Flags {
  final bool nsfw;
  final bool religious;
  final bool political;
  final bool racist;
  final bool sexist;
  final bool explicit;

  Flags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      nsfw: json['nsfw'] ?? false,
      religious: json['religious'] ?? false,
      political: json['political'] ?? false,
      racist: json['racist'] ?? false,
      sexist: json['sexist'] ?? false,
      explicit: json['explicit'] ?? false,
    );
  }
}
