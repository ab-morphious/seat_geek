import 'package:equatable/equatable.dart';

class Event extends Equatable {
  const Event({
    required this.id,
    required this.datetimeLocal,
    required this.shortTitle,
    required this.url,
    required this.title,
    required this.description,
  });

  final int id;
  final DateTime datetimeLocal;
  final String shortTitle;
  final String url;
  final String title;
  final String description;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        datetimeLocal: DateTime.parse(json["datetime_local"]),
        shortTitle: json["short_title"],
        url: json["url"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "datetime_local": datetimeLocal.toIso8601String(),
        "short_title": shortTitle,
        "url": url,
        "title": title,
        "description": description,
      };

  @override
  List<Object?> get props => [id, shortTitle, url, title, description];
}
