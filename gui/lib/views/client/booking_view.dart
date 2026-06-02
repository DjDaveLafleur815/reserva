import 'package:flutter/material.dart';

class BookingView extends StatefulWidget {
  final String proName;
  final String service;

  const BookingView({super.key, required this.proName, required this.service});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  String? selectedDate;
  String? selectedTime;

  final List<String> dates = [
    'Mer 4 Juin',
    'Jeu 5 Juin',
    'Ven 6 Juin',
    'Sam 7 Juin',
  ];
  final List<String> times = ['09:00', '10:30', '14:00', '15:30', '17:00'];

  void _confirmBooking() {
    if (selectedDate == null || selectedTime == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('✅ Rendez-vous confirmé !'),
        content: Text(
          'Votre RDV avec ${widget.proName}\n'
          'pour ${widget.service}\n'
          'le $selectedDate à $selectedTime\n\n'
          'Vous recevrez une confirmation par email.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prendre RDV')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.indigo,
                ),
                title: Text(
                  widget.proName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.service),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Choisissez une date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(dates[index]),
                    selected: selectedDate == dates[index],
                    onSelected: (selected) => setState(
                      () => selectedDate = selected ? dates[index] : null,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Choisissez un horaire',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: times
                  .map(
                    (time) => ChoiceChip(
                      label: Text(time),
                      selected: selectedTime == time,
                      onSelected: (selected) =>
                          setState(() => selectedTime = selected ? time : null),
                    ),
                  )
                  .toList(),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: (selectedDate != null && selectedTime != null)
                    ? _confirmBooking
                    : null,
                child: const Text(
                  'Confirmer le rendez-vous',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
