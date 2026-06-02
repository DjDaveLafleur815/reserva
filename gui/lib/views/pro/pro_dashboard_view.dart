import 'package:flutter/material.dart';

class ProDashboardView extends StatefulWidget {
  const ProDashboardView({super.key});

  @override
  State<ProDashboardView> createState() => _ProDashboardViewState();
}

class _ProDashboardViewState extends State<ProDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Tableau de Bord'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bonjour, Sophie 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Voici ton résumé du jour',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                _buildStatCard('RDV aujourd\'hui', '4', Icons.calendar_today),
                const SizedBox(width: 12),
                _buildStatCard('Revenus du jour', '185 €', Icons.euro),
              ],
            ),

            const SizedBox(height: 32),

            const Text(
              'Prochains rendez-vous',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildAppointmentCard('14:00', 'Lucas Moreau', 'Coupe Homme'),
            _buildAppointmentCard('15:30', 'Emma Dubois', 'Brushing'),
            _buildAppointmentCard('17:00', 'Marie Leclerc', 'Coloration'),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Ajouter un créneau'),
                onPressed: () => _showAddSlotDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 32, color: Colors.indigo),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(String time, String client, String service) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(client),
        subtitle: Text(service),
        trailing: Text(
          time,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showAddSlotDialog(BuildContext context) {
    String? selectedDate = 'Mer 4 Juin';
    String? selectedTime = '09:00';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: const Text('Ajouter un créneau'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Date'),
                DropdownButton<String>(
                  value: selectedDate,
                  isExpanded: true,
                  items:
                      ['Mer 4 Juin', 'Jeu 5 Juin', 'Ven 6 Juin', 'Sam 7 Juin']
                          .map(
                            (date) => DropdownMenuItem(
                              value: date,
                              child: Text(date),
                            ),
                          )
                          .toList(),
                  onChanged: (value) =>
                      setStateDialog(() => selectedDate = value),
                ),
                const SizedBox(height: 16),
                const Text('Horaire'),
                DropdownButton<String>(
                  value: selectedTime,
                  isExpanded: true,
                  items: ['09:00', '10:00', '11:00', '14:00', '15:30', '17:00']
                      .map(
                        (time) =>
                            DropdownMenuItem(value: time, child: Text(time)),
                      )
                      .toList(),
                  onChanged: (value) =>
                      setStateDialog(() => selectedTime = value),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Créneau ajouté : $selectedDate à $selectedTime',
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text('Ajouter le créneau'),
              ),
            ],
          );
        },
      ),
    );
  }
}
