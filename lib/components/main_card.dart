import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String cityName;
  final IconData icon;
  final String weatherDescription;
  final int temperature;

  const MainCard({
    super.key,
    required this.cityName,
    required this.weatherDescription,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                cityName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "$temperature°C".toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Icon(
                icon,
                size: 32,
              ),
              SizedBox(height: 16),
              Text(
                weatherDescription.toUpperCase(),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
