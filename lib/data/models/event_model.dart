import 'package:equatable/equatable.dart';
import 'package:seat_geek/domain/entities/Event.dart';

class EventModel extends Equatable {
  const EventModel({
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

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
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

  Event toEntity() => Event(
      id: id,
      datetimeLocal: datetimeLocal,
      shortTitle: shortTitle,
      url: url, title: title,
      description: description);
}
