import 'package:flutter/material.dart';

class JustForYouSection extends StatefulWidget {
  const JustForYouSection({super.key});

  @override
  State<JustForYouSection> createState() => _JustForYouSectionState();
}

class _JustForYouSectionState extends State<JustForYouSection> {
  final List<Map<String, String>> products = [
    {"image": "asset/image/pic56.png", "title": "Lorem ipsum dolor sit amet", "price": "\$17,00"},
    {"image": "asset/image/pic57.png", "title": "Lorem ipsum dolor sit amet", "price": "\$17,00"},
    {"image": "asset/image/pic58.png", "title": "Lorem ipsum dolor sit amet", "price": "\$17,00"},
    {"image": "asset/image/pic59.png", "title": "Lorem ipsum dolor sit amet", "price": "\$17,00"},
    {"image": "asset/image/pic67.png", "title": "Lorem ipsum dolor sit amet", "price": "\$17,00"},
    {"image": "asset/image/pic68.png", "title": "Lorem ipsum dolor sit amet", "price": "\$17,00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Title
          const Row(
            children: [
              Text(
                "Just For You",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 6),
              Icon(Icons.star, color: Color(0xFF004CFF), size: 18),
            ],
          ),
          const SizedBox(height: 16),

          // 🔹 Grid Items
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to full-screen zoomable image
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImageZoomScreen(
                        imagePath: products[index]["image"]!,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                        child: Image.asset(
                          products[index]["image"]!,
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // 🔹 Text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          products[index]["title"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'NunitoSans',
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // 🔹 Price
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          products[index]["price"]!,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// ================= FULL-SCREEN ZOOMABLE IMAGE SCREEN =================
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
