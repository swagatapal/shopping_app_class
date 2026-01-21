import 'package:flutter/material.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> storyImages = [
      'asset/image/pic31.png',
      'asset/image/pic30.png',
      'asset/image/pic32.png',
      'asset/image/pic28.png',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Stories",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: storyImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: 80,
                  height: 130,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // Navigate to zoomable image screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ImageZoomScreen(imagePath: storyImages[index]),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          // Story image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              storyImages[index],
                              width: 80,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // "Live" badge on first story
                          if (index == 0)
                            Positioned(
                              top: 6,
                              left: 6,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  "Live",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                          // Play icon overlay on first story
                          if (index == 0)
                            const Positioned(
                              bottom: 6,
                              right: 6,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 16,
                                  color: Colors.red,
                                ),
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
        ),
      ],
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
