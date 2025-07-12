import 'package:flutter/material.dart';

class PetGalleryScreen extends StatelessWidget {
  const PetGalleryScreen({super.key});

  final List<Map<String, String>> pets = const [
    {
      'name': 'Bella',
      'image': 'https://i.imgur.com/1Hh5oOe.jpg',
      'breed': 'Golden Retriever',
    },
    {
      'name': 'Max',
      'image': 'https://i.imgur.com/zL4Krbz.jpg',
      'breed': 'Siberian Husky',
    },
    {
      'name': 'Luna',
      'image': 'https://i.imgur.com/w1bt3p2.jpg',
      'breed': 'Tabby Cat',
    },
    {
      'name': 'Charlie',
      'image': 'https://i.imgur.com/7p3zvbp.jpg',
      'breed': 'Bulldog',
    },
  ];

  void _showPetDetails(BuildContext context, Map<String, String> pet) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(pet['name']!),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(pet['image']!, height: 150),
            const SizedBox(height: 10),
            Text('Breed: ${pet['breed']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Gallery'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: pets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final pet = pets[index];
            return GestureDetector(
              onTap: () => _showPetDetails(context, pet),
              child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        pet['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        pet['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
