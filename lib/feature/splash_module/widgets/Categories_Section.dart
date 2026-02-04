import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  Function() onTap;
   CategoriesSection({super.key,required this.onTap});
  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "Clothing",
        "count": "109",
        "images": [
          "asset/image/pic40.png",
          "asset/image/pic41.png",
          "asset/image/pic42.png",
          "asset/image/pic43.png",
        ],
      },
      {
        "title": "Shoes",
        "count": "530",
        "images": [
          "asset/image/pic44.png",
          "asset/image/pic45.png",
          "asset/image/pic46.png",
          "asset/image/pic47.png",
        ],
      },
      {
        "title": "Bags",
        "count": "87",
        "images": [
          "asset/image/pic48.png",
          "asset/image/pic49.png",
          "asset/image/pic50.png",
          "asset/image/pic51.png",
        ],
      },
      {
        "title": "Lingerie",
        "count": "218",
        "images": [
          "asset/image/pic52.png",
          "asset/image/pic53.png",
          "asset/image/pic54.png",
          "asset/image/pic55.png",
        ],
      },
      {
        "title": "Watch",
        "count": "218",
        "images": [
          "asset/image/pic71.png",
          "asset/image/pic72.png",
          "asset/image/pic73.png",
          "asset/image/pic74.png",
        ],
      },
      {
        "title": "Hoodies",
        "count": "218",
        "images": [
          "asset/image/pic75.png",
          "asset/image/pic76.png",
          "asset/image/pic77.png",
          "asset/image/pic78.png",
        ],
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap:onTap,
                child: Row(
                  children: const [
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
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
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// CATEGORY GRID (2 x 2)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];

              return GestureDetector(
                onTap: () {
                  // Whole category tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryDetailScreen(
                        title: category["title"] as String,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 4 IMAGES GRID
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                          ),
                          itemBuilder: (context, imgIndex) {
                            return GestureDetector(
                              onTap: () {
                                showImagePreview(
                                  context,
                                  (category["images"] as List<String>)[imgIndex],
                                );
                              },

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  (category["images"] as List<String>)[imgIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// TITLE + COUNT
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            category["title"] as String,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            category["count"] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
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

/// SEE ALL SCREEN
class CategoriesSeeAllScreen extends StatelessWidget {
  const CategoriesSeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Categories")),
      body: const Center(child: Text("All categories here")),
    );
  }
}

/// CATEGORY DETAIL SCREEN
class CategoryDetailScreen extends StatelessWidget {
  final String title;

  const CategoryDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("Products for $title")),
    );
  }
}
void showImagePreview(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    barrierColor: Colors.black,
    builder: (_) => Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              child: Image.asset(imagePath),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    ),
  );
}

