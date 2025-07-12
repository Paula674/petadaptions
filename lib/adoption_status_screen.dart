import 'package:flutter/material.dart';

class AdoptionStatusScreen extends StatelessWidget {
  const AdoptionStatusScreen({super.key});

  final List<Map<String, String>> adoptionRequests = const [
    {
      'pet': 'Buddy',
      'date': '2025-07-10',
      'status': 'Pending',
    },
    {
      'pet': 'Luna',
      'date': '2025-06-25',
      'status': 'Approved',
    },
    {
      'pet': 'Mittens',
      'date': '2025-06-01',
      'status': 'Rejected',
    },
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      case 'Pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Status'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: adoptionRequests.length,
        itemBuilder: (context, index) {
          final request = adoptionRequests[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text('Pet: ${request['pet']}'),
              subtitle: Text('Date: ${request['date']}'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getStatusColor(request['status']!),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  request['status']!,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
