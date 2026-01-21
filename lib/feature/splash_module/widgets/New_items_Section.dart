import 'package:flutter/material.dart';

class NewItemsSection extends StatefulWidget {
  const NewItemsSection({super.key});

  @override
  State<NewItemsSection> createState() => _NewItemsSectionState();
}

class _NewItemsSectionState extends State<NewItemsSection> {
  // Sample data for items
  final List<Map<String, String>> items = [
    {
      'image': 'asset/image/pic33.png',
      'title': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$17,00'
    },
    {
      'image': 'asset/image/pic34.png',
      'title': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$32,00'
    },
    {
      'image': 'asset/image/pic35.png',
      'title': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$21,00'
    },
    {
      'image': 'asset/image/pic37.png',
      'title': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$19,00'
    },
    {
      'image': 'asset/image/pic46.png',
      'title': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$17,00'
    },
    {
      'image': 'asset/image/pic45.png',
      'title': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$17,00'
    },
    {
      'image': 'asset/image/pic44.png',
      'title': 'Lorem ipsum dolor sit amet consectetur.',
      'price': '\$17,00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with "New Items" and "See All" + arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Items",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // You can still navigate to a full list screen if needed
                },
                child: Row(
                  children: [
                    const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF202020),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF004CFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          // Horizontal list of items
          SizedBox(
            height: 205,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to zoomable image screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ImageZoomScreen(imagePath: item['image']!),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.asset(
                            item['image']!,
                            height: 130,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            item['title']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'NunitoSans',
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Price
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            item['price']!,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

/// Full-screen zoomable image screen
class ImageZoomScreen extends StatelessWidget {
  final String imagePath;
  const ImageZoomScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: InteractiveViewer(
        panEnabled: true,
        minScale: 1.0,
        maxScale: 4.0,
        child: Center(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
