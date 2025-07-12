import 'package:flutter/material.dart';

class PetFilterScreen extends StatefulWidget {
  const PetFilterScreen({super.key});

  @override
  State<PetFilterScreen> createState() => _PetFilterScreenState();
}

class _PetFilterScreenState extends State<PetFilterScreen> {
  String _selectedType = 'Any';
  String _selectedGender = 'Any';
  bool _vaccinatedOnly = false;
  double _ageRange = 5;

  void _applyFilters() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filters applied! Showing filtered results.'),
      ),
    );
    // Add logic here to filter the pet list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Pets"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Type:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 10,
              children: [
                ChoiceChip(
                  label: const Text('Any'),
                  selected: _selectedType == 'Any',
                  onSelected: (_) => setState(() => _selectedType = 'Any'),
                ),
                ChoiceChip(
                  label: const Text('Dog'),
                  selected: _selectedType == 'Dog',
                  onSelected: (_) => setState(() => _selectedType = 'Dog'),
                ),
                ChoiceChip(
                  label: const Text('Cat'),
                  selected: _selectedType == 'Cat',
                  onSelected: (_) => setState(() => _selectedType = 'Cat'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Gender:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: const Text('Any'),
              value: 'Any',
              groupValue: _selectedGender,
              onChanged: (val) => setState(() => _selectedGender = val!),
            ),
            RadioListTile(
              title: const Text('Male'),
              value: 'Male',
              groupValue: _selectedGender,
              onChanged: (val) => setState(() => _selectedGender = val!),
            ),
            RadioListTile(
              title: const Text('Female'),
              value: 'Female',
              groupValue: _selectedGender,
              onChanged: (val) => setState(() => _selectedGender = val!),
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text('Vaccinated Only'),
              value: _vaccinatedOnly,
              onChanged: (val) => setState(() => _vaccinatedOnly = val!),
            ),
            const SizedBox(height: 20),
            const Text(
              'Max Age (years):',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              min: 1,
              max: 15,
              divisions: 14,
              value: _ageRange,
              label: '${_ageRange.toInt()}',
              onChanged: (val) => setState(() => _ageRange = val),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _applyFilters,
              icon: const Icon(Icons.filter_alt),
              label: const Text('Apply Filters'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
