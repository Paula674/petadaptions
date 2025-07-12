import 'package:flutter/material.dart';

class UserActivityLogsScreen extends StatelessWidget {
  const UserActivityLogsScreen({super.key});

  final List<Map<String, String>> _logs = const [
    {
      'user': 'Liam Garcia',
      'action': 'Submitted an adoption form',
      'timestamp': 'July 11, 2025 – 10:32 AM'
    },
    {
      'user': 'Emily Zhang',
      'action': 'Logged in',
      'timestamp': 'July 11, 2025 – 9:58 AM'
    },
    {
      'user': 'Noah Patel',
      'action': 'Submitted feedback',
      'timestamp': 'July 10, 2025 – 8:45 PM'
    },
    {
      'user': 'Sofia Reyes',
      'action': 'Updated profile info',
      'timestamp': 'July 10, 2025 – 6:21 PM'
    },
  ];

  Icon _getIcon(String action) {
    if (action.contains('login') || action.contains('Logged')) {
      return const Icon(Icons.login, color: Colors.blue);
    } else if (action.contains('adoption')) {
      return const Icon(Icons.pets, color: Colors.green);
    } else if (action.contains('feedback')) {
      return const Icon(Icons.feedback, color: Colors.orange);
    } else if (action.contains('profile')) {
      return const Icon(Icons.person, color: Colors.teal);
    } else {
      return const Icon(Icons.info, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Activity Logs'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: _logs.length,
        itemBuilder: (context, index) {
          final log = _logs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: _getIcon(log['action'] ?? ''),
              title: Text('${log['user']}'),
              subtitle: Text('${log['action']}\n${log['timestamp']}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
