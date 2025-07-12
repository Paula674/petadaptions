import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  bool _receiveUpdates = true;
  String _preferredTheme = 'System Default';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notificationsEnabled,
            activeColor: Colors.teal,
            onChanged: (val) {
              setState(() => _notificationsEnabled = val);
            },
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkMode,
            activeColor: Colors.teal,
            onChanged: (val) {
              setState(() => _darkMode = val);
            },
          ),
          CheckboxListTile(
            title: const Text("Receive Adoption Tips via Email"),
            value: _receiveUpdates,
            activeColor: Colors.teal,
            onChanged: (val) {
              setState(() => _receiveUpdates = val ?? false);
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Preferred Theme",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          RadioListTile(
            title: const Text("System Default"),
            value: 'System Default',
            groupValue: _preferredTheme,
            onChanged: (value) {
              setState(() => _preferredTheme = value.toString());
            },
          ),
          RadioListTile(
            title: const Text("Light"),
            value: 'Light',
            groupValue: _preferredTheme,
            onChanged: (value) {
              setState(() => _preferredTheme = value.toString());
            },
          ),
          RadioListTile(
            title: const Text("Dark"),
            value: 'Dark',
            groupValue: _preferredTheme,
            onChanged: (value) {
              setState(() => _preferredTheme = value.toString());
            },
          ),
        ],
      ),
    );
  }
}
