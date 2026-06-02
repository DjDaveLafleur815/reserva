import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pro_detail_view.dart';

class ClientHomeView extends StatelessWidget {
  const ClientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rechercher un professionnel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Coiffeur, Esthéticienne, Mécanicien...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Professionnels près de chez vous',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                children: [
                  _buildProCard(
                    context,
                    name: 'Sophie Laurent',
                    job: 'Coiffeuse',
                    rating: '4.8',
                    distance: '500m',
                  ),
                  _buildProCard(
                    context,
                    name: 'Lucas Moreau',
                    job: 'Esthéticien',
                    rating: '4.6',
                    distance: '1.2km',
                  ),
                  _buildProCard(
                    context,
                    name: 'Emma Dubois',
                    job: 'Manucure',
                    rating: '5.0',
                    distance: '800m',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProCard(
    BuildContext context, {
    required String name,
    required String job,
    required String rating,
    required String distance,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.indigo,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(job),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(rating, style: const TextStyle(color: Colors.amber)),
            Text(distance, style: const TextStyle(fontSize: 12)),
          ],
        ),
        onTap: () {
          context.push(
            '/pro-detail',
            extra: {'name': name, 'job': job, 'rating': rating},
          );
        },
      ),
    );
  }
}
