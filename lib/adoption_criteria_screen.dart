import 'package:flutter/material.dart';

class AdoptionCriteriaScreen extends StatefulWidget {
  const AdoptionCriteriaScreen({super.key});

  @override
  State<AdoptionCriteriaScreen> createState() => _AdoptionCriteriaScreenState();
}

class _AdoptionCriteriaScreenState extends State<AdoptionCriteriaScreen> {
  bool _requireHomeVisit = true;
  bool _requireIDProof = true;
  int _minAge = 18;
  String _houseType = 'Any';

  final List<String> _houseOptions = ['Any', 'Apartment', 'Detached', 'Farm'];

  void _showSavedSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Adoption criteria updated successfully.'),
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _saveCriteria() {
    // In real app, send data to backend
    _showSavedSnackbar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Criteria Settings'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Requirements:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Require Home Visit'),
              value: _requireHomeVisit,
              onChanged: (value) {
                setState(() => _requireHomeVisit = value);
              },
            ),
            SwitchListTile(
              title: const Text('Require Valid ID Proof'),
              value: _requireIDProof,
              onChanged: (value) {
                setState(() => _requireIDProof = value);
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Minimum Adopter Age:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Stepper(
              currentStep: _minAge - 18,
              onStepContinue: () {
                if (_minAge < 100) {
                  setState(() => _minAge++);
                }
              },
              onStepCancel: () {
                if (_minAge > 18) {
                  setState(() => _minAge--);
                }
              },
              steps: [
                Step(
                  title: Text('Age: $_minAge'),
                  content: const Text('Adjust minimum adopter age'),
                  isActive: true,
                  state: StepState.indexed,
                ),
              ],
              controlsBuilder: (context, _) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: _minAge < 100
                          ? () => setState(() => _minAge++)
                          : null,
                      child: const Text('+'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _minAge > 18
                          ? () => setState(() => _minAge--)
                          : null,
                      child: const Text('-'),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Preferred House Type:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: _houseOptions.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _houseType,
                  onChanged: (value) {
                    setState(() => _houseType = value!);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _saveCriteria,
              icon: const Icon(Icons.save),
              label: const Text('Save Criteria'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
