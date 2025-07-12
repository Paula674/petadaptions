// admin_dashboard_screen.dart
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text('Manage Pets'),
            onTap: () => Navigator.pushNamed(context, '/petList'),
          ),
          ListTile(
            leading: const Icon(Icons.announcement),
            title: const Text('Post Announcement'),
            onTap: () => Navigator.pushNamed(context, '/announcement'),
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('View Feedback'),
            onTap: () => Navigator.pushNamed(context, '/viewFeedback'),
          ),
          ListTile(
            leading: const Icon(Icons.rule),
            title: const Text('Adoption Criteria'),
            onTap: () => Navigator.pushNamed(context, '/adoptionCriteria'),
          ),
          ListTile(
            leading: const Icon(Icons.archive),
            title: const Text('Archive Applications'),
            onTap: () => Navigator.pushNamed(context, '/archiveApplications'),
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('User Activity Logs'),
            onTap: () => Navigator.pushNamed(context, '/userLogs'),
          ),
        ],
      ),
    );
  }
}
