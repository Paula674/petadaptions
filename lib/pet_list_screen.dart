import 'package:flutter/material.dart';
import 'pet_detail_screen.dart';

class PetListScreen extends StatelessWidget {
  const PetListScreen({super.key});

  final List<Map<String, String>> pets = const [
    {
      'name': 'Buddy',
      'type': 'Dog',
      'image': 'c:UsersJAYDownloadsdownload.jpg',
    },
    {
      'name': 'Mittens',
      'type': 'Cat',
      'image': 'c:UsersJAYDownloadsdownload (1).jpg',
    },
    {
      'name': 'Charlie',
      'type': 'Dog',
      'image': 'c:UsersJAYDownloadsdownload (3).jpg',
    },
    {
      'name': 'Luna',
      'type': 'Cat',
      'image': 'c:UsersJAYDownloadsdownload (2).jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Pets"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PetDetailScreen(pet: pet),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(pet['image']!),
                ),
                title: Text(pet['name']!),
                subtitle: Text(pet['type']!),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        },
      ),
    );
  }
}
