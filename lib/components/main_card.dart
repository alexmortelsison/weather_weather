import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.blue.shade900,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "26°C",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Icon(Icons.cloud, size: 64),
            SizedBox(height: 16),
            Text(
              "Rain",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
