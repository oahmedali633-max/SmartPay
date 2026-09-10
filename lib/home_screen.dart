import 'package:flutter/material.dart';
import 'internet_screen.dart';
import 'mixes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('Smart Pay'), backgroundColor: Colors.blue),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          children: [
            _buildCard(context, 'الإنترنت', Icons.wifi, Colors.orange, InternetScreen()),
            _buildCard(context, 'ميكسات', Icons.local_offer, Colors.green, MixesScreen()),
            _buildCard(context, 'شحن رصيد', Icons.phone_android, Colors.purple, Container()),
            _buildCard(context, 'فواتير', Icons.receipt, Colors.red, Container()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, Widget screen) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
