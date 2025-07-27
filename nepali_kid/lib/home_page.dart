import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8B5CF6), // A purple background color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Top illustration image
                    Image.network(
                      'https://placehold.co/300x250/8B5CF6/FFFFFF?text=Kid+Learning', // Placeholder image for the kid
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 250,
                          color: const Color(0xFF8B5CF6),
                          child: const Center(
                            child: Icon(
                              Icons.child_care,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    // LEARN button
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement LEARN functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('LEARN button pressed!'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                          0xFFFF6B6B,
                        ), // Reddish-orange color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'LEARN',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Grid of learning sections
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: const [
                    LearningSectionCard(
                      title: 'Letters',
                      icon: 'A B C', // Using text for ABC
                      backgroundColor: Color(0xFFFFF3CD), // Light yellow
                      textColor: Color(0xFFC084FC), // Purple for text
                    ),
                    LearningSectionCard(
                      title: 'Numbers',
                      icon: '1 2 3', // Using text for 123
                      backgroundColor: Color(0xFFD1FAE5), // Light green
                      textColor: Color(0xFF6EE7B7), // Teal for text
                    ),
                    LearningSectionCard(
                      title: 'Shapes',
                      icon: '▲ ● ■', // Using text for shapes
                      backgroundColor: Color(0xFFFED7AA), // Light orange
                      textColor: Color(0xFFFB923C), // Darker orange for text
                    ),
                    LearningSectionCard(
                      title: 'Animals',
                      icon: '🦁', // Using an emoji for animal
                      backgroundColor: Color(0xFFFEE2E2), // Light red
                      textColor: Color(0xFFEF4444), // Red for text
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Add some space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

class LearningSectionCard extends StatelessWidget {
  final String title;
  final String icon; // Using String for icon to support text or emoji
  final Color backgroundColor;
  final Color textColor;

  const LearningSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                icon,
                style: TextStyle(
                  fontSize: 50, // Adjust size for icons/emojis
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
