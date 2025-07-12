import 'package:flutter/material.dart';

class ViewFeedbackScreen extends StatefulWidget {
  const ViewFeedbackScreen({super.key});

  @override
  State<ViewFeedbackScreen> createState() => _ViewFeedbackScreenState();
}

class _ViewFeedbackScreenState extends State<ViewFeedbackScreen> {
  final List<Map<String, String>> _feedbackList = [
    {
      'subject': 'Adoption Process',
      'message': 'The adoption was smooth and easy. Thank you!',
      'user': 'Maria L.'
    },
    {
      'subject': 'Pet Listing Issue',
      'message': 'One of the listings has outdated info.',
      'user': 'Jake R.'
    },
    {
      'subject': 'Great App!',
      'message': 'Loved the UI and experience. Keep it up!',
      'user': 'Anna K.'
    },
  ];

  void _handleLongPress(String subject) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Options'),
        content: Text('You long-pressed on "$subject".'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  Widget _buildFeedbackCard(Map<String, String> feedback) {
    return GestureDetector(
      onLongPress: () => _handleLongPress(feedback['subject'] ?? ''),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        child: ListTile(
          title: Text(feedback['subject'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(feedback['message'] ?? ''),
          trailing: Text(
            feedback['user'] ?? '',
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Feedback'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: _feedbackList.map(_buildFeedbackCard).toList(),
        ),
      ),
    );
  }
}
