import 'package:equatable/equatable.dart';
import 'package:seat_geek/domain/entities/Event.dart';

class Events {
  Events({
    required this.events,
  });

  List<EventModel> events;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        events: List<EventModel>.from(
            json["events"].map((x) => EventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class EventModel extends Equatable {
  const EventModel({
    required this.id,
    required this.datetimeLocal,
    required this.shortTitle,
    required this.url,
    required this.title,
    required this.description,
    required this.performer
  });

  final int id;
  final DateTime datetimeLocal;
  final String shortTitle;
  final String url;
  final String title;
  final String description;
  final Performer performer;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        datetimeLocal: DateTime.parse(json["datetime_local"]),
        shortTitle: json["short_title"],
        url: json["url"],
        title: json["title"],
        description: json["description"],
        performer: json["performer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "datetime_local": datetimeLocal.toIso8601String(),
        "short_title": shortTitle,
        "url": url,
        "title": title,
        "description": description,
        "performer": performer
      };

  @override
  List<Object?> get props => [id, shortTitle, url, title, description];

  Event toEntity() => Event(
      id: id,
      datetimeLocal: datetimeLocal,
      shortTitle: shortTitle,
      url: url,
      title: title,
      description: description);
}

class Performer {
  Performer({
    required this.image,
  });
  String image;

  factory Performer.fromJson(Map<String, dynamic> json) => Performer(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}
