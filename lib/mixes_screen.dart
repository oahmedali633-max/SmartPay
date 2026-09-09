import 'package:flutter/material.dart';

class MixesScreen extends StatelessWidget {
  const MixesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mixes = [
      {'title': 'باقة 10 جنيه', 'units': '450 وحدة', 'price': '10'},
      {'title': 'باقة 25 جنيه', 'units': '1200 وحدة', 'price': '25'},
      {'title': 'باقة 50 جنيه', 'units': '2800 وحدة', 'price': '50'},
      {'title': 'باقة 100 جنيه', 'units': '6000 وحدة', 'price': '100'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('وحدات وميكسات'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختر الباقة المناسبة لك',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: mixes.length,
                itemBuilder: (context, index) {
                  final mix = mixes[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.local_offer, color: Colors.white),
                      ),
                      title: Text(
                        mix['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          'تحتوي على: ${mix['units']}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم اختيار ${mix['title']} بسعر ${mix['price']} جنيه')),
                          );
                        },
                        child: const Text('اختيار'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
