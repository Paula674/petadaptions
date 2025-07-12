import 'package:flutter/material.dart';

class ReportPetScreen extends StatefulWidget {
  const ReportPetScreen({super.key});

  @override
  State<ReportPetScreen> createState() => _ReportPetScreenState();
}

class _ReportPetScreenState extends State<ReportPetScreen> {
  final List<String> _reasons = [
    'Inappropriate photo',
    'False information',
    'Already adopted',
    'Offensive content',
  ];

  final TextEditingController _otherReasonController = TextEditingController();
  final Set<String> _selectedReasons = {};

  void _submitReport() {
    if (_selectedReasons.isEmpty && _otherReasonController.text.trim().isEmpty) {
      Fluttertoast.showToast(
        msg: "Please select or enter a reason.",
        backgroundColor: Colors.red,
        textColor: Colors.white, gravity: null, toastLength: null,
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Report'),
        content: const Text('Are you sure you want to report this pet listing?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: "Report submitted.",
                backgroundColor: Colors.teal,
                textColor: Colors.white, gravity: null, toastLength: null,
              );
              setState(() {
                _selectedReasons.clear();
                _otherReasonController.clear();
              });
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxList() {
    return Column(
      children: _reasons.map((reason) {
        return CheckboxListTile(
          title: Text(reason),
          value: _selectedReasons.contains(reason),
          onChanged: (bool? selected) {
            setState(() {
              if (selected == true) {
                _selectedReasons.add(reason);
              } else {
                _selectedReasons.remove(reason);
              }
            });
          },
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Pet Listing'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Reason for reporting:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildCheckboxList(),
            const SizedBox(height: 12),
            TextFormField(
              controller: _otherReasonController,
              decoration: const InputDecoration(
                labelText: 'Other (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _submitReport,
              icon: const Icon(Icons.report),
              label: const Text('Submit Report'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Fluttertoast {
  static void showToast({required String msg, required MaterialColor backgroundColor, required Color textColor, required gravity, required toastLength}) {}
}
