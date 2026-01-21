import 'package:flutter/material.dart';

class TopProductsSection extends StatefulWidget {
  const TopProductsSection({super.key});

  @override
  State<TopProductsSection> createState() => _TopProductsSectionState();
}

class _TopProductsSectionState extends State<TopProductsSection> {
  final List<String> productImages = [
    'asset/image/pic62.png',
    'asset/image/pic63.png',
    'asset/image/pic64.png',
    'asset/image/pic65.png',
    'asset/image/pic66.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Products",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ImageZoomScreen(
                          imagePath: productImages[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(productImages[index]),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
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

/// ================= FULL-SCREEN ZOOMABLE IMAGE =================
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
