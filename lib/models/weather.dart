class Weather {
  final String cityName;
  final String description;
  final int humidity;
  final double windSpeed;
  final int pressure;

  Weather({
    required this.cityName,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      description: json["weather"][0]["description"],
      humidity: json["main"]["humidity"],
      windSpeed: (json["wind"]["speed"] as num).toDouble(),
      pressure: json["main"]["pressure"],
    );
  }
}
