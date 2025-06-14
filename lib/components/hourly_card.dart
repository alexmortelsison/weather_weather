import 'package:flutter/material.dart';

class HourlyCard extends StatelessWidget {
  final IconData icon;
  final String temperature;
  final String time;
  const HourlyCard({
    super.key,
    required this.icon,
    required this.temperature,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.blue.shade900,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Icon(icon, size: 32),
              SizedBox(height: 8),
              Text(
                temperature,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
