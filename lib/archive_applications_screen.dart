import 'package:flutter/material.dart';

class ArchiveApplicationsScreen extends StatefulWidget {
  const ArchiveApplicationsScreen({super.key});

  @override
  State<ArchiveApplicationsScreen> createState() => _ArchiveApplicationsScreenState();
}

class _ArchiveApplicationsScreenState extends State<ArchiveApplicationsScreen> {
  List<Map<String, String>> _applications = [
    {
      'name': 'Liam Garcia',
      'pet': 'Bella the Labrador',
      'date': 'July 2, 2025'
    },
    {
      'name': 'Emily Zhang',
      'pet': 'Milo the Cat',
      'date': 'June 25, 2025'
    },
    {
      'name': 'Noah Patel',
      'pet': 'Rocky the Bulldog',
      'date': 'June 15, 2025'
    },
  ];

  void _confirmArchive(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Archive'),
        content: Text(
            'Are you sure you want to archive the application of ${_applications[index]['name']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _applications.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Application archived.'),
                  backgroundColor: Colors.teal,
                ),
              );
            },
            child: const Text('Archive'),
          ),
        ],
      ),
    );
  }

  Widget _buildApplicationCard(Map<String, String> app, int index) {
    return Dismissible(
      key: Key(app['name']!),
      background: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.archive, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        _confirmArchive(index);
        return false; // Don't auto-dismiss, handled manually
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        child: ListTile(
          leading: const Icon(Icons.pets, color: Colors.teal),
          title: Text(app['name'] ?? ''),
          subtitle: Text('${app['pet']} — ${app['date']}'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive Applications'),
        backgroundColor: Colors.teal,
      ),
      body: _applications.isEmpty
          ? const Center(child: Text('No completed applications to archive.'))
          : Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: _applications.length,
                itemBuilder: (context, index) =>
                    _buildApplicationCard(_applications[index], index),
              ),
            ),
    );
  }
}
