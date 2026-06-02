import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'booking_view.dart';

class ProDetailView extends StatelessWidget {
  final String name;
  final String job;
  final String rating;

  const ProDetailView({
    super.key,
    required this.name,
    required this.job,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.indigo,
                child: const Icon(Icons.person, size: 70, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                job,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            Center(
              child: Text(
                '$rating • Très bien noté',
                style: const TextStyle(color: Colors.amber),
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'Services proposés',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildService(context, 'Coupe Homme', '30 min', '35 €'),
            _buildService(context, 'Coupe Femme', '45 min', '55 €'),
            _buildService(context, 'Coloration', '90 min', '85 €'),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.push(
                    '/booking',
                    extra: {'proName': name, 'service': 'Coupe Homme'},
                  );
                },
                child: const Text(
                  'Prendre rendez-vous',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildService(
    BuildContext context,
    String name,
    String duration,
    String price,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(name),
        subtitle: Text(duration),
        trailing: Text(
          price,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {
          context.push(
            '/booking',
            extra: {'proName': this.name, 'service': name},
          );
        },
      ),
    );
  }
}
