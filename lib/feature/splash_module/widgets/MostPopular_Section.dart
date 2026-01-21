import 'package:flutter/material.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {"image": "asset/image/pic35.png", "price": "1780", "tag": "New"},
      {"image": "asset/image/pic37.png", "price": "1780", "tag": "Sale"},
      {"image": "asset/image/pic38.png", "price": "1780", "tag": "Hot"},
      {"image": "asset/image/pic39.png", "price": "1780", "tag": "Stylish"},
      {"image": "asset/image/pic82.png", "price": "1780", "tag": "New"},
      {"image": "asset/image/pic81.png", "price": "1780", "tag": "Sale"},
      {"image": "asset/image/pic80.png", "price": "1780", "tag": "Hot"},
      {"image": "asset/image/pic79.png", "price": "1780", "tag": "Sale"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Most Popular",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to all most popular items screen if needed
                },
                child: Row(
                  children: const [
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 4),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Color(0xFF004CFF),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 14,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 12),

          /// PRODUCT LIST
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    // Navigate to full-screen image view
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ImageZoomScreen(imagePath: product["image"]!),
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
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// IMAGE
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            product["image"]!,
                            height: 180,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                        ),

                        /// PRICE + FAVORITE + TAG TEXT
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    product["price"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.favorite,
                                    color: Color(0xFF0042E0),
                                    size: 14,
                                  ),
                                ],
                              ),
                              if (product["tag"]!.isNotEmpty)
                                Text(
                                  product["tag"]!,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF202020),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Full-screen zoomable image view
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
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 4.0,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
