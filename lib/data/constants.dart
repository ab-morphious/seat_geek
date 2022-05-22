class Urls{
  static const String baseUrl = "https://api.seatgeek.com/2";
  static const String clientId = "MjcwOTg1OTV8MTY1MzIwNDA5MC45MzAzMTA3";
  static String eventsListUrl(String query) =>
      '$baseUrl/events?client_id=$clientId&q=$query';
}