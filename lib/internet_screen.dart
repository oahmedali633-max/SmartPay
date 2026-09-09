import 'package:flutter/material.dart';

class InternetScreen extends StatelessWidget {
  const InternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> internetPackages = [
      {'title': 'باقة 5 جيجابايت', 'price': '30 جنيه', 'validity': 'أسبوع'},
      {'title': 'باقة 15 جيجابايت', 'price': '70 جنيه', 'validity': 'أسبوعين'},
      {'title': 'باقة 40 جيجابايت', 'price': '150 جنيه', 'validity': 'شهر كامل'},
      {'title': 'باقة 100 جيجابايت', 'price': '300 جنيه', 'validity': 'شهر كامل'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('باقات الإنترنت'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختر باقة الإنترنت المناسبة لاستهلاكك',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: internetPackages.length,
                itemBuilder: (context, index) {
                  final pkg = internetPackages[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.wifi, color: Colors.white),
                      ),
                      title: Text(
                        pkg['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          'السعر: ${pkg['price']} - الصلاحية: ${pkg['validity']}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم تفعيل ${pkg['title']} بنجاح')),
                          );
                        },
                        child: const Text('تفعيل'),
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
