import 'package:flutter/material.dart';

class AdditionalInfoCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String result;
  const AdditionalInfoCard({
    super.key,
    required this.icon,
    required this.text,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, size: 32),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              result,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
