import 'package:flutter/material.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    // 👉 list of images
    final List<String> images = [
      'asset/image/pic18.png',
      'asset/image/pic19.png',
      'asset/image/pic20.png',
      'asset/image/pic21.png',
      'asset/image/pic22.png',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recently viewed",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to full-screen zoomable image
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ImageZoomScreen(imagePath: images[index]),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage: AssetImage(images[index]),
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
      body: InteractiveViewer(
        panEnabled: true,
        minScale: 1.0,
        maxScale: 4.0,
        child: Center(
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain, // Ensures image scales correctly
          ),
        ),
      ),
    );
  }
}
