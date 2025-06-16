class Weather {
  final String cityName;
  final String description;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final int temperature;

  Weather({
    required this.cityName,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      description: json["weather"][0]["description"],
      humidity: json["main"]["humidity"],
      windSpeed: (json["wind"]["speed"] as num).toDouble(),
      pressure: json["main"]["pressure"],
      temperature: (json["main"]["temp"] as num).round(),
    );
  }
}
