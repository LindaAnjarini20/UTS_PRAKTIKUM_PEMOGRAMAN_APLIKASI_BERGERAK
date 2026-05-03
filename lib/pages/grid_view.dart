import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'icon': Icons.fastfood,
        'title': 'Makanan',
        'color': Colors.red,
      },
      {
        'icon': Icons.directions_car,
        'title': 'Transportasi',
        'color': Colors.blue,
      },
      {
        'icon': Icons.shopping_bag,
        'title': 'Belanja',
        'color': Colors.purple,
      },
      {
        'icon': Icons.movie,
        'title': 'Hiburan',
        'color': Colors.orange,
      },
      {
        'icon': Icons.sports_basketball,
        'title': 'Olahraga',
        'color': Colors.green,
      },
      {
        'icon': Icons.school,
        'title': 'Pendidikan',
        'color': Colors.teal,
      },
      {
        'icon': Icons.local_hospital,
        'title': 'Kesehatan',
        'color': Colors.pink,
      },
      {
        'icon': Icons.music_note,
        'title': 'Musik',
        'color': Colors.indigo,
      },
      {
        'icon': Icons.camera_alt,
        'title': 'Fotografi',
        'color': Colors.cyan,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grid View',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.1,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${items[index]['title']} dipilih'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: items[index]['color'].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: items[index]['color'],
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: items[index]['color'].withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      items[index]['icon'],
                      size: 40,
                      color: items[index]['color'],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      items[index]['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: items[index]['color'],
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
