import 'package:flutter/material.dart';
import 'counter.dart';
import 'layered_widget.dart';
import 'user_input.dart';
import 'dynamic_list.dart';
import 'simple_navigation.dart';
import 'grid_view.dart';
import 'about_me.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Track which buttons were clicked - persistent state
  final Set<int> selectedIndices = {};

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Counter',
      'description': 'Aplikasi penghitung interaktif',
      'icon': Icons.add_circle_outline,
      'page': const CounterPage(),
      'color': Colors.red,
    },
    {
      'title': 'Widget Bertingkat',
      'description': 'Membuat widget dengan struktur berlapis',
      'icon': Icons.layers,
      'page': const LayeredWidgetPage(),
      'color': Colors.deepPurple,
    },
    {
      'title': 'User Input Example',
      'description': 'Menangani input dari pengguna',
      'icon': Icons.edit_note,
      'page': const UserInputPage(),
      'color': Colors.orange,
    },
    {
      'title': 'Dynamic List Example',
      'description': 'Daftar yang dapat berubah secara dinamis',
      'icon': Icons.list_alt,
      'page': const DynamicListPage(),
      'color': Colors.green,
    },
    {
      'title': 'Navigasi Sederhana',
      'description': 'Navigasi antar halaman aplikasi',
      'icon': Icons.navigation,
      'page': const SimpleNavigationPage(),
      'color': Colors.cyan,
    },
    {
      'title': 'Grid View',
      'description': 'Menampilkan data dalam bentuk grid',
      'icon': Icons.grid_on,
      'page': const GridViewPage(),
      'color': Colors.teal,
    },
    {
      'title': 'Tentang Saya',
      'description': 'Profil dan informasi pribadi',
      'icon': Icons.person_2_outlined,
      'page': const AboutMePage(),
      'color': Colors.pink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Modern AppBar with gradient
          SliverAppBar(
            expandedHeight: 140,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade700, Colors.blue.shade900],
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MyPorto',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Koleksi Aplikasi Flutter',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Main Content
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue.withValues(alpha: 0.08),
                            Colors.blue.withValues(alpha: 0.02),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.blue.withValues(alpha: 0.2),
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.star_outline,
                              color: Colors.blue,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Pilih dan klik untuk melihat demonya!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    // Projects ListView
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndices.contains(index);
                        Color projectColor = projects[index]['color'];
                        
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedIndices.remove(index);
                                } else {
                                  selectedIndices.add(index);
                                }
                              });
                              // Navigate to the selected page after animation
                              if (mounted) {
                                Future.delayed(const Duration(milliseconds: 100), () {
                                  if (mounted) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => projects[index]['page'],
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOutCubic,
                              decoration: BoxDecoration(
                                gradient: isSelected
                                    ? LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          projectColor,
                                          projectColor.withValues(alpha: 0.75),
                                        ],
                                      )
                                    : LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.grey[100]!,
                                          Colors.grey[200]!,
                                        ],
                                      ),
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: (isSelected ? projectColor : Colors.grey.shade300)
                                        .withValues(alpha: isSelected ? 0.5 : 0.3),
                                    blurRadius: isSelected ? 15 : 8,
                                    offset: Offset(0, isSelected ? 8 : 4),
                                    spreadRadius: isSelected ? 1 : 0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 16,
                                ),
                                child: Row(
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.white.withValues(alpha: 0.25)
                                            : projectColor.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Icon(
                                        projects[index]['icon'],
                                        size: 26,
                                        color: isSelected
                                            ? Colors.white
                                            : projectColor,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            projects[index]['title'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black87,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            projects[index]['description'],
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: isSelected
                                                  ? Colors.white.withValues(alpha: 0.85)
                                                  : Colors.grey[600],
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    AnimatedRotation(
                                      turns: isSelected ? 0.5 : 0,
                                      duration: const Duration(milliseconds: 300),
                                      child: Icon(
                                        Icons.chevron_right,
                                        size: 24,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
